defmodule Demo.ChatDOTFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.ChatDOT` context.
  """

  @doc """
  Generate a chat.
  """
  def chat_fixture(attrs \\ %{}) do
    {:ok, chat} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> Demo.ChatDOT.create_chat()

    chat
  end
end
