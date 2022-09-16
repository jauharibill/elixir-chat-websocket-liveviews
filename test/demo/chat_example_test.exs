defmodule Demo.ChatExampleTest do
  use Demo.DataCase

  alias Demo.ChatExample

  describe "chats" do
    alias Demo.ChatExample.Chat

    import Demo.ChatExampleFixtures

    @invalid_attrs %{body: nil, sender: nil}

    test "list_chats/0 returns all chats" do
      chat = chat_fixture()
      assert ChatExample.list_chats() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert ChatExample.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      valid_attrs = %{body: "some body", sender: "some sender"}

      assert {:ok, %Chat{} = chat} = ChatExample.create_chat(valid_attrs)
      assert chat.body == "some body"
      assert chat.sender == "some sender"
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ChatExample.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      update_attrs = %{body: "some updated body", sender: "some updated sender"}

      assert {:ok, %Chat{} = chat} = ChatExample.update_chat(chat, update_attrs)
      assert chat.body == "some updated body"
      assert chat.sender == "some updated sender"
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = ChatExample.update_chat(chat, @invalid_attrs)
      assert chat == ChatExample.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = ChatExample.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> ChatExample.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = ChatExample.change_chat(chat)
    end
  end
end
