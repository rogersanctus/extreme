defmodule Extreme.Messages.OperationResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:PrepareTimeout, 1)
  field(:CommitTimeout, 2)
  field(:ForwardTimeout, 3)
  field(:WrongExpectedVersion, 4)
  field(:StreamDeleted, 5)
  field(:InvalidTransaction, 6)
  field(:AccessDenied, 7)
end

defmodule Extreme.Messages.ReadEventCompleted.ReadEventResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:NotFound, 1)
  field(:NoStream, 2)
  field(:StreamDeleted, 3)
  field(:Error, 4)
  field(:AccessDenied, 5)
end

defmodule Extreme.Messages.ReadStreamEventsCompleted.ReadStreamResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:NoStream, 1)
  field(:StreamDeleted, 2)
  field(:NotModified, 3)
  field(:Error, 4)
  field(:AccessDenied, 5)
end

defmodule Extreme.Messages.ReadAllEventsCompleted.ReadAllResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:NotModified, 1)
  field(:Error, 2)
  field(:AccessDenied, 3)
end

defmodule Extreme.Messages.Filter.FilterContext do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:StreamId, 0)
  field(:EventType, 1)
end

defmodule Extreme.Messages.Filter.FilterType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Regex, 0)
  field(:Prefix, 1)
end

defmodule Extreme.Messages.FilteredReadAllEventsCompleted.FilteredReadAllResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:NotModified, 1)
  field(:Error, 2)
  field(:AccessDenied, 3)
end

defmodule Extreme.Messages.UpdatePersistentSubscriptionCompleted.UpdatePersistentSubscriptionResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:DoesNotExist, 1)
  field(:Fail, 2)
  field(:AccessDenied, 3)
end

defmodule Extreme.Messages.CreatePersistentSubscriptionCompleted.CreatePersistentSubscriptionResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:AlreadyExists, 1)
  field(:Fail, 2)
  field(:AccessDenied, 3)
end

defmodule Extreme.Messages.DeletePersistentSubscriptionCompleted.DeletePersistentSubscriptionResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Success, 0)
  field(:DoesNotExist, 1)
  field(:Fail, 2)
  field(:AccessDenied, 3)
end

defmodule Extreme.Messages.PersistentSubscriptionNakEvents.NakAction do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Unknown, 0)
  field(:Park, 1)
  field(:Retry, 2)
  field(:Skip, 3)
  field(:Stop, 4)
end

defmodule Extreme.Messages.SubscriptionDropped.SubscriptionDropReason do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Unsubscribed, 0)
  field(:AccessDenied, 1)
  field(:NotFound, 2)
  field(:PersistentSubscriptionDeleted, 3)
  field(:SubscriberMaxCountReached, 4)
end

defmodule Extreme.Messages.NotHandled.NotHandledReason do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:NotReady, 0)
  field(:TooBusy, 1)
  field(:NotLeader, 2)
  field(:IsReadOnly, 3)
end

defmodule Extreme.Messages.ScavengeDatabaseResponse.ScavengeResult do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:Started, 0)
  field(:InProgress, 1)
  field(:Unauthorized, 2)
end

defmodule Extreme.Messages.NewEvent do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_id, 1, type: :bytes, json_name: "eventId")
  field(:event_type, 2, type: :string, json_name: "eventType")
  field(:data_content_type, 3, type: :int32, json_name: "dataContentType")
  field(:metadata_content_type, 4, type: :int32, json_name: "metadataContentType")
  field(:data, 5, type: :bytes)
  field(:metadata, 6, type: :bytes)
end

defmodule Extreme.Messages.EventRecord do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:event_number, 2, type: :int64, json_name: "eventNumber")
  field(:event_id, 3, type: :bytes, json_name: "eventId")
  field(:event_type, 4, type: :string, json_name: "eventType")
  field(:data_content_type, 5, type: :int32, json_name: "dataContentType")
  field(:metadata_content_type, 6, type: :int32, json_name: "metadataContentType")
  field(:data, 7, type: :bytes)
  field(:metadata, 8, type: :bytes)
  field(:created, 9, type: :int64)
  field(:created_epoch, 10, type: :int64, json_name: "createdEpoch")
end

defmodule Extreme.Messages.ResolvedIndexedEvent do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event, 1, type: Extreme.Messages.EventRecord)
  field(:link, 2, type: Extreme.Messages.EventRecord)
end

defmodule Extreme.Messages.ResolvedEvent do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event, 1, type: Extreme.Messages.EventRecord)
  field(:link, 2, type: Extreme.Messages.EventRecord)
  field(:commit_position, 3, type: :int64, json_name: "commitPosition")
  field(:prepare_position, 4, type: :int64, json_name: "preparePosition")
end

defmodule Extreme.Messages.WriteEvents do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:expected_version, 2, type: :int64, json_name: "expectedVersion")
  field(:events, 3, repeated: true, type: Extreme.Messages.NewEvent)
  field(:require_leader, 4, type: :bool, json_name: "requireLeader")
end

defmodule Extreme.Messages.WriteEventsCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:result, 1, type: Extreme.Messages.OperationResult, enum: true)
  field(:message, 2, type: :string)
  field(:first_event_number, 3, type: :int64, json_name: "firstEventNumber")
  field(:last_event_number, 4, type: :int64, json_name: "lastEventNumber")
  field(:prepare_position, 5, type: :int64, json_name: "preparePosition")
  field(:commit_position, 6, type: :int64, json_name: "commitPosition")
  field(:current_version, 7, type: :int64, json_name: "currentVersion")
end

defmodule Extreme.Messages.DeleteStream do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:expected_version, 2, type: :int64, json_name: "expectedVersion")
  field(:require_leader, 3, type: :bool, json_name: "requireLeader")
  field(:hard_delete, 4, type: :bool, json_name: "hardDelete")
end

defmodule Extreme.Messages.DeleteStreamCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:result, 1, type: Extreme.Messages.OperationResult, enum: true)
  field(:message, 2, type: :string)
  field(:prepare_position, 3, type: :int64, json_name: "preparePosition")
  field(:commit_position, 4, type: :int64, json_name: "commitPosition")
  field(:current_version, 5, type: :int64, json_name: "currentVersion")
end

defmodule Extreme.Messages.TransactionStart do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:expected_version, 2, type: :int64, json_name: "expectedVersion")
  field(:require_leader, 3, type: :bool, json_name: "requireLeader")
end

defmodule Extreme.Messages.TransactionStartCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:transaction_id, 1, type: :int64, json_name: "transactionId")
  field(:result, 2, type: Extreme.Messages.OperationResult, enum: true)
  field(:message, 3, type: :string)
end

defmodule Extreme.Messages.TransactionWrite do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:transaction_id, 1, type: :int64, json_name: "transactionId")
  field(:events, 2, repeated: true, type: Extreme.Messages.NewEvent)
  field(:require_leader, 3, type: :bool, json_name: "requireLeader")
end

defmodule Extreme.Messages.TransactionWriteCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:transaction_id, 1, type: :int64, json_name: "transactionId")
  field(:result, 2, type: Extreme.Messages.OperationResult, enum: true)
  field(:message, 3, type: :string)
end

defmodule Extreme.Messages.TransactionCommit do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:transaction_id, 1, type: :int64, json_name: "transactionId")
  field(:require_leader, 2, type: :bool, json_name: "requireLeader")
end

defmodule Extreme.Messages.TransactionCommitCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:transaction_id, 1, type: :int64, json_name: "transactionId")
  field(:result, 2, type: Extreme.Messages.OperationResult, enum: true)
  field(:message, 3, type: :string)
  field(:first_event_number, 4, type: :int64, json_name: "firstEventNumber")
  field(:last_event_number, 5, type: :int64, json_name: "lastEventNumber")
  field(:prepare_position, 6, type: :int64, json_name: "preparePosition")
  field(:commit_position, 7, type: :int64, json_name: "commitPosition")
end

defmodule Extreme.Messages.ReadEvent do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:event_number, 2, type: :int64, json_name: "eventNumber")
  field(:resolve_link_tos, 3, type: :bool, json_name: "resolveLinkTos")
  field(:require_leader, 4, type: :bool, json_name: "requireLeader")
end

defmodule Extreme.Messages.ReadEventCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:result, 1, type: Extreme.Messages.ReadEventCompleted.ReadEventResult, enum: true)
  field(:event, 2, type: Extreme.Messages.ResolvedIndexedEvent)
  field(:error, 3, type: :string)
end

defmodule Extreme.Messages.ReadStreamEvents do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:from_event_number, 2, type: :int64, json_name: "fromEventNumber")
  field(:max_count, 3, type: :int32, json_name: "maxCount")
  field(:resolve_link_tos, 4, type: :bool, json_name: "resolveLinkTos")
  field(:require_leader, 5, type: :bool, json_name: "requireLeader")
end

defmodule Extreme.Messages.ReadStreamEventsCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:events, 1, repeated: true, type: Extreme.Messages.ResolvedIndexedEvent)
  field(:result, 2, type: Extreme.Messages.ReadStreamEventsCompleted.ReadStreamResult, enum: true)
  field(:next_event_number, 3, type: :int64, json_name: "nextEventNumber")
  field(:last_event_number, 4, type: :int64, json_name: "lastEventNumber")
  field(:is_end_of_stream, 5, type: :bool, json_name: "isEndOfStream")
  field(:last_commit_position, 6, type: :int64, json_name: "lastCommitPosition")
  field(:error, 7, type: :string)
end

defmodule Extreme.Messages.ReadAllEvents do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:commit_position, 1, type: :int64, json_name: "commitPosition")
  field(:prepare_position, 2, type: :int64, json_name: "preparePosition")
  field(:max_count, 3, type: :int32, json_name: "maxCount")
  field(:resolve_link_tos, 4, type: :bool, json_name: "resolveLinkTos")
  field(:require_leader, 5, type: :bool, json_name: "requireLeader")
end

defmodule Extreme.Messages.ReadAllEventsCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:commit_position, 1, type: :int64, json_name: "commitPosition")
  field(:prepare_position, 2, type: :int64, json_name: "preparePosition")
  field(:events, 3, repeated: true, type: Extreme.Messages.ResolvedEvent)
  field(:next_commit_position, 4, type: :int64, json_name: "nextCommitPosition")
  field(:next_prepare_position, 5, type: :int64, json_name: "nextPreparePosition")
  field(:result, 6, type: Extreme.Messages.ReadAllEventsCompleted.ReadAllResult, enum: true)
  field(:error, 7, type: :string)
end

defmodule Extreme.Messages.Filter do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:context, 1, type: Extreme.Messages.Filter.FilterContext, enum: true)
  field(:type, 2, type: Extreme.Messages.Filter.FilterType, enum: true)
  field(:data, 3, repeated: true, type: :string)
end

defmodule Extreme.Messages.FilteredReadAllEvents do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:commit_position, 1, type: :int64, json_name: "commitPosition")
  field(:prepare_position, 2, type: :int64, json_name: "preparePosition")
  field(:max_count, 3, type: :int32, json_name: "maxCount")
  field(:max_search_window, 4, type: :int32, json_name: "maxSearchWindow")
  field(:resolve_link_tos, 5, type: :bool, json_name: "resolveLinkTos")
  field(:require_leader, 6, type: :bool, json_name: "requireLeader")
  field(:filter, 7, type: Extreme.Messages.Filter)
end

defmodule Extreme.Messages.FilteredReadAllEventsCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:commit_position, 1, type: :int64, json_name: "commitPosition")
  field(:prepare_position, 2, type: :int64, json_name: "preparePosition")
  field(:events, 3, repeated: true, type: Extreme.Messages.ResolvedEvent)
  field(:next_commit_position, 4, type: :int64, json_name: "nextCommitPosition")
  field(:next_prepare_position, 5, type: :int64, json_name: "nextPreparePosition")
  field(:is_end_of_stream, 6, type: :bool, json_name: "isEndOfStream")

  field(:result, 7,
    type: Extreme.Messages.FilteredReadAllEventsCompleted.FilteredReadAllResult,
    enum: true
  )

  field(:error, 8, type: :string)
end

defmodule Extreme.Messages.CreatePersistentSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:subscription_group_name, 1, type: :string, json_name: "subscriptionGroupName")
  field(:event_stream_id, 2, type: :string, json_name: "eventStreamId")
  field(:resolve_link_tos, 3, type: :bool, json_name: "resolveLinkTos")
  field(:start_from, 4, type: :int64, json_name: "startFrom")
  field(:message_timeout_milliseconds, 5, type: :int32, json_name: "messageTimeoutMilliseconds")
  field(:record_statistics, 6, type: :bool, json_name: "recordStatistics")
  field(:live_buffer_size, 7, type: :int32, json_name: "liveBufferSize")
  field(:read_batch_size, 8, type: :int32, json_name: "readBatchSize")
  field(:buffer_size, 9, type: :int32, json_name: "bufferSize")
  field(:max_retry_count, 10, type: :int32, json_name: "maxRetryCount")
  field(:prefer_round_robin, 11, type: :bool, json_name: "preferRoundRobin")
  field(:checkpoint_after_time, 12, type: :int32, json_name: "checkpointAfterTime")
  field(:checkpoint_max_count, 13, type: :int32, json_name: "checkpointMaxCount")
  field(:checkpoint_min_count, 14, type: :int32, json_name: "checkpointMinCount")
  field(:subscriber_max_count, 15, type: :int32, json_name: "subscriberMaxCount")
  field(:named_consumer_strategy, 16, type: :string, json_name: "namedConsumerStrategy")
end

defmodule Extreme.Messages.DeletePersistentSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:subscription_group_name, 1, type: :string, json_name: "subscriptionGroupName")
  field(:event_stream_id, 2, type: :string, json_name: "eventStreamId")
end

defmodule Extreme.Messages.UpdatePersistentSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:subscription_group_name, 1, type: :string, json_name: "subscriptionGroupName")
  field(:event_stream_id, 2, type: :string, json_name: "eventStreamId")
  field(:resolve_link_tos, 3, type: :bool, json_name: "resolveLinkTos")
  field(:start_from, 4, type: :int64, json_name: "startFrom")
  field(:message_timeout_milliseconds, 5, type: :int32, json_name: "messageTimeoutMilliseconds")
  field(:record_statistics, 6, type: :bool, json_name: "recordStatistics")
  field(:live_buffer_size, 7, type: :int32, json_name: "liveBufferSize")
  field(:read_batch_size, 8, type: :int32, json_name: "readBatchSize")
  field(:buffer_size, 9, type: :int32, json_name: "bufferSize")
  field(:max_retry_count, 10, type: :int32, json_name: "maxRetryCount")
  field(:prefer_round_robin, 11, type: :bool, json_name: "preferRoundRobin")
  field(:checkpoint_after_time, 12, type: :int32, json_name: "checkpointAfterTime")
  field(:checkpoint_max_count, 13, type: :int32, json_name: "checkpointMaxCount")
  field(:checkpoint_min_count, 14, type: :int32, json_name: "checkpointMinCount")
  field(:subscriber_max_count, 15, type: :int32, json_name: "subscriberMaxCount")
  field(:named_consumer_strategy, 16, type: :string, json_name: "namedConsumerStrategy")
end

defmodule Extreme.Messages.UpdatePersistentSubscriptionCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:result, 1,
    type:
      Extreme.Messages.UpdatePersistentSubscriptionCompleted.UpdatePersistentSubscriptionResult,
    enum: true
  )

  field(:reason, 2, type: :string)
end

defmodule Extreme.Messages.CreatePersistentSubscriptionCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:result, 1,
    type:
      Extreme.Messages.CreatePersistentSubscriptionCompleted.CreatePersistentSubscriptionResult,
    enum: true
  )

  field(:reason, 2, type: :string)
end

defmodule Extreme.Messages.DeletePersistentSubscriptionCompleted do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:result, 1,
    type:
      Extreme.Messages.DeletePersistentSubscriptionCompleted.DeletePersistentSubscriptionResult,
    enum: true
  )

  field(:reason, 2, type: :string)
end

defmodule Extreme.Messages.ConnectToPersistentSubscription do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:subscription_id, 1, type: :string, json_name: "subscriptionId")
  field(:event_stream_id, 2, type: :string, json_name: "eventStreamId")
  field(:allowed_in_flight_messages, 3, type: :int32, json_name: "allowedInFlightMessages")
end

defmodule Extreme.Messages.PersistentSubscriptionAckEvents do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:subscription_id, 1, type: :string, json_name: "subscriptionId")
  field(:processed_event_ids, 2, repeated: true, type: :bytes, json_name: "processedEventIds")
end

defmodule Extreme.Messages.PersistentSubscriptionNakEvents do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:subscription_id, 1, type: :string, json_name: "subscriptionId")
  field(:processed_event_ids, 2, repeated: true, type: :bytes, json_name: "processedEventIds")
  field(:message, 3, type: :string)
  field(:action, 4, type: Extreme.Messages.PersistentSubscriptionNakEvents.NakAction, enum: true)
end

defmodule Extreme.Messages.PersistentSubscriptionConfirmation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:last_commit_position, 1, type: :int64, json_name: "lastCommitPosition")
  field(:subscription_id, 2, type: :string, json_name: "subscriptionId")
  field(:last_event_number, 3, type: :int64, json_name: "lastEventNumber")
end

defmodule Extreme.Messages.PersistentSubscriptionStreamEventAppeared do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event, 1, type: Extreme.Messages.ResolvedIndexedEvent)
  field(:retryCount, 2, type: :int32)
end

defmodule Extreme.Messages.SubscribeToStream do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:resolve_link_tos, 2, type: :bool, json_name: "resolveLinkTos")
end

defmodule Extreme.Messages.FilteredSubscribeToStream do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event_stream_id, 1, type: :string, json_name: "eventStreamId")
  field(:resolve_link_tos, 2, type: :bool, json_name: "resolveLinkTos")
  field(:filter, 3, type: Extreme.Messages.Filter)
  field(:checkpoint_interval, 4, type: :int32, json_name: "checkpointInterval")
end

defmodule Extreme.Messages.CheckpointReached do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:commit_position, 1, type: :int64, json_name: "commitPosition")
  field(:prepare_position, 2, type: :int64, json_name: "preparePosition")
end

defmodule Extreme.Messages.SubscriptionConfirmation do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:last_commit_position, 1, type: :int64, json_name: "lastCommitPosition")
  field(:last_event_number, 2, type: :int64, json_name: "lastEventNumber")
end

defmodule Extreme.Messages.StreamEventAppeared do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:event, 1, type: Extreme.Messages.ResolvedEvent)
end

defmodule Extreme.Messages.UnsubscribeFromStream do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Extreme.Messages.SubscriptionDropped do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:reason, 1, type: Extreme.Messages.SubscriptionDropped.SubscriptionDropReason, enum: true)
end

defmodule Extreme.Messages.NotHandled.LeaderInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:external_tcp_address, 1, type: :string, json_name: "externalTcpAddress")
  field(:external_tcp_port, 2, type: :int32, json_name: "externalTcpPort")
  field(:http_address, 3, type: :string, json_name: "httpAddress")
  field(:http_port, 4, type: :int32, json_name: "httpPort")
  field(:external_secure_tcp_address, 5, type: :string, json_name: "externalSecureTcpAddress")
  field(:external_secure_tcp_port, 6, type: :int32, json_name: "externalSecureTcpPort")
end

defmodule Extreme.Messages.NotHandled do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:reason, 1, type: Extreme.Messages.NotHandled.NotHandledReason, enum: true)
  field(:additional_info, 2, type: :bytes, json_name: "additionalInfo")
end

defmodule Extreme.Messages.ScavengeDatabase do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end

defmodule Extreme.Messages.ScavengeDatabaseResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:result, 1, type: Extreme.Messages.ScavengeDatabaseResponse.ScavengeResult, enum: true)
  field(:scavengeId, 2, type: :string)
end

defmodule Extreme.Messages.IdentifyClient do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field(:version, 1, type: :int32)
  field(:connection_name, 2, type: :string, json_name: "connectionName")
end

defmodule Extreme.Messages.ClientIdentified do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3
end
