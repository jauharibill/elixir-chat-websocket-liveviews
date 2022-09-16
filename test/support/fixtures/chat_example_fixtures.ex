defmodule Demo.ChatExampleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.ChatExample` context.
  """

  @doc """
  Generate a chat.
  """
  def chat_fixture(attrs \\ %{}) do
    {:ok, chat} =
      attrs
      |> Enum.into(%{
        body: "some body",
        sender: "some sender"
      })
      |> Demo.ChatExample.create_chat()

    chat
  end
end
