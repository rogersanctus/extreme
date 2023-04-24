defmodule Extreme.Request do
  alias Extreme.Tools
  require Logger

  def prepare(:heartbeat_response = cmd, correlation_id) do
    res = <<Extreme.MessageResolver.encode_cmd(cmd), 0>> <> correlation_id
    size = byte_size(res)

    {:ok, <<size::32-unsigned-little-integer>> <> res}
  end

  def prepare(:ping = cmd, correlation_id) do
    res = <<Extreme.MessageResolver.encode_cmd(cmd), 0>> <> correlation_id
    size = byte_size(res)

    {:ok, <<size::32-unsigned-little-integer>> <> res}
  end

  def prepare(:identify_client, connection_name, credentials) do
    Extreme.Messages.IdentifyClient.new(
      version: 1,
      connection_name: connection_name
    )
    |> prepare(credentials, Tools.generate_uuid())
  end

  def prepare(protobuf_msg, credentials, correlation_id) do
    cmd = protobuf_msg.__struct__
    data = cmd.encode(protobuf_msg)
    _to_binary(cmd, correlation_id, credentials, data)
  end

  def prepare(:ReadStreamEventsBackward = cmd, credentials, correlation_id, %{
        stream: stream,
        start: start,
        count: count
      }) do
    msg =
      Extreme.Messages.ReadStreamEvents.new(
        event_stream_id: stream,
        from_event_number: start,
        max_count: count,
        resolve_link_tos: true,
        require_leader: false
      )

    data = Extreme.Messages.ReadStreamEvents.encode(msg)
    _to_binary(cmd, correlation_id, credentials, data)
  end

  defp _to_binary(cmd, correlation_id, credentials, data) do
    res = <<Extreme.MessageResolver.encode_cmd(cmd), 1>> <> correlation_id <> credentials <> data
    size = byte_size(res)

    {:ok, <<size::32-unsigned-little-integer>> <> res}
  end
end
