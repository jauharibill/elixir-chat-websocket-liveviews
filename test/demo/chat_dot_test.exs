defmodule Demo.ChatDOTTest do
  use Demo.DataCase

  alias Demo.ChatDOT

  describe "sender" do
    alias Demo.ChatDOT.Chat

    import Demo.ChatDOTFixtures

    @invalid_attrs %{body: nil}

    test "list_sender/0 returns all sender" do
      chat = chat_fixture()
      assert ChatDOT.list_sender() == [chat]
    end

    test "get_chat!/1 returns the chat with given id" do
      chat = chat_fixture()
      assert ChatDOT.get_chat!(chat.id) == chat
    end

    test "create_chat/1 with valid data creates a chat" do
      valid_attrs = %{body: "some body"}

      assert {:ok, %Chat{} = chat} = ChatDOT.create_chat(valid_attrs)
      assert chat.body == "some body"
    end

    test "create_chat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ChatDOT.create_chat(@invalid_attrs)
    end

    test "update_chat/2 with valid data updates the chat" do
      chat = chat_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Chat{} = chat} = ChatDOT.update_chat(chat, update_attrs)
      assert chat.body == "some updated body"
    end

    test "update_chat/2 with invalid data returns error changeset" do
      chat = chat_fixture()
      assert {:error, %Ecto.Changeset{}} = ChatDOT.update_chat(chat, @invalid_attrs)
      assert chat == ChatDOT.get_chat!(chat.id)
    end

    test "delete_chat/1 deletes the chat" do
      chat = chat_fixture()
      assert {:ok, %Chat{}} = ChatDOT.delete_chat(chat)
      assert_raise Ecto.NoResultsError, fn -> ChatDOT.get_chat!(chat.id) end
    end

    test "change_chat/1 returns a chat changeset" do
      chat = chat_fixture()
      assert %Ecto.Changeset{} = ChatDOT.change_chat(chat)
    end
  end
end
