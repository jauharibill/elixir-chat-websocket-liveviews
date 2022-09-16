defmodule Demo.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.Chat` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        datetime: "some datetime",
        sender: "some sender",
        text: "some text"
      })
      |> Demo.Chat.create_message()

    message
  end
end
