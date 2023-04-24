defmodule Extreme.Response do
  require Logger

  def get_correlation_id(<<_message_type, _auth, correlation_id::16-binary, _data::binary>>),
    do: correlation_id

  def parse(<<message_type, auth, correlation_id::16-binary, data::binary>>) do
    case Extreme.MessageResolver.decode_cmd(message_type) do
      :NotAuthenticated ->
        {:error, :NotAuthenticated, correlation_id}

      :heartbeat_request_command ->
        {:heartbeat_request, correlation_id}

      :pong ->
        {:pong, correlation_id}

      :ClientIdentified ->
        {:ClientIdentified, correlation_id}

      :BadRequest ->
        {:error, :BadRequest, correlation_id}

      response_struct ->
        data = response_struct.decode(data)
        {auth, correlation_id, data}
    end
  end

  def reply(%{result: error} = msg, _correlation_id) when error != :Success,
    do: {:error, error, msg}

  def reply(response, _correlation_id), do: {:ok, response}
end
