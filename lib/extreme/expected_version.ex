defmodule Extreme.ExpectedVersion do
  @moduledoc """
  ExpectedVersion contains the expected version constants.
  """

  @any -2
  @no_stream -1
  @stream_exists -4

  @doc """
  The write should not conflict with anything and should always succeed.
  """
  def any, do: @any

  @doc """
  The stream should not yet exist. If it does exist treat that as a concurrency problem.
  """
  def no_stream, do: @no_stream

  @doc """
  The stream should exist. If it or a metadata stream does not exist treat that as a concurrency problem.
  """
  def stream_exists, do: @stream_exists
end
