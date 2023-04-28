defmodule ExtremeTest.Events do
  defmodule(PersonCreated, do: defstruct([:name]))
  defmodule(PersonChangedName, do: defstruct([:name]))
  defmodule(SlowProcessingEventHappened, do: defstruct([:sleep]))
end

defmodule ExtremeTest.Helpers do
  alias Extreme.Messages, as: ExMsg
  alias ExtremeTest.Events, as: Event
  alias Extreme.ExpectedVersion
  require ExUnit.Assertions
  import ExUnit.Assertions

  def random_stream_name, do: "extreme_test-" <> to_string(UUID.uuid1())

  def write_events(
        stream \\ random_stream_name(),
        events \\ [
          %Event.PersonCreated{name: "Pera Peric"},
          %Event.PersonChangedName{name: "Zika"}
        ],
        expected_version \\ ExpectedVersion.any()
      ) do
    proto_events =
      Enum.map(events, fn event ->
        %ExMsg.NewEvent{
          event_id: Extreme.Tools.generate_uuid(),
          event_type: to_string(event.__struct__),
          data_content_type: 0,
          metadata_content_type: 0,
          data: :erlang.term_to_binary(event),
          metadata: ""
        }
      end)

    %ExMsg.WriteEvents{
      event_stream_id: stream,
      expected_version: expected_version,
      events: proto_events,
      require_leader: false
    }
  end

  def delete_stream(stream, hard_delete, expected_version \\ ExpectedVersion.any()) do
    %ExMsg.DeleteStream{
      event_stream_id: stream,
      expected_version: expected_version,
      require_leader: false,
      hard_delete: hard_delete
    }
  end

  def read_events(stream, start \\ 0, count \\ 1) do
    %ExMsg.ReadStreamEvents{
      event_stream_id: stream,
      from_event_number: start,
      max_count: count,
      resolve_link_tos: true,
      require_leader: false
    }
  end

  def read_event(stream, position) do
    %ExMsg.ReadEvent{
      event_stream_id: stream,
      event_number: position,
      resolve_link_tos: true,
      require_leader: false
    }
  end

  def unsubscribe(extreme, subscription) do
    :unsubscribed = extreme.unsubscribe(subscription)
    assert_no_leaks(extreme)
  end

  def assert_no_leaks(base_name) do
    assert(
      %{received_data: ""} = Extreme.Connection._name(base_name) |> :sys.get_state(),
      "There are unprocessed received data in connection process"
    )

    %{requests: requests, subscriptions: subscriptions} =
      Extreme.RequestManager._name(base_name) |> :sys.get_state()

    assert Enum.empty?(requests),
           "There are #{Enum.count(requests)} waiting requests in request manager"

    assert Enum.empty?(subscriptions),
           "There are #{Enum.count(subscriptions)} opened subscriptions in request manager"

    children_count =
      Extreme.RequestManager._process_supervisor_name(base_name)
      |> Supervisor.which_children()
      |> Enum.count()

    assert 0 == children_count, "There are #{children_count} hanging request processes"

    children_count =
      Extreme.SubscriptionsSupervisor._name(base_name)
      |> Supervisor.which_children()
      |> Enum.count()

    assert 0 == children_count, "There are #{children_count} hanging subscription processes"
  end

  def create_persistent_subscription(stream, group) do
    %ExMsg.CreatePersistentSubscription{
      subscription_group_name: group,
      event_stream_id: stream,
      resolve_link_tos: true,
      start_from: 0,
      message_timeout_milliseconds: 500,
      record_statistics: false,
      live_buffer_size: 500,
      read_batch_size: 20,
      buffer_size: 500,
      max_retry_count: 10,
      prefer_round_robin: true,
      checkpoint_after_time: 1_000,
      checkpoint_max_count: 500,
      checkpoint_min_count: 1,
      subscriber_max_count: 1
    }
  end

  def delete_persistent_subscription(stream, group) do
    %ExMsg.DeletePersistentSubscription{
      subscription_group_name: group,
      event_stream_id: stream
    }
  end
end
