defmodule Demo.ChatTest do
  use Demo.DataCase

  alias Demo.Chat

  describe "messages" do
    alias Demo.Chat.Message

    import Demo.ChatFixtures

    @invalid_attrs %{datetime: nil, sender: nil, text: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Chat.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Chat.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{datetime: "some datetime", sender: "some sender", text: "some text"}

      assert {:ok, %Message{} = message} = Chat.create_message(valid_attrs)
      assert message.datetime == "some datetime"
      assert message.sender == "some sender"
      assert message.text == "some text"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{datetime: "some updated datetime", sender: "some updated sender", text: "some updated text"}

      assert {:ok, %Message{} = message} = Chat.update_message(message, update_attrs)
      assert message.datetime == "some updated datetime"
      assert message.sender == "some updated sender"
      assert message.text == "some updated text"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_message(message, @invalid_attrs)
      assert message == Chat.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Chat.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Chat.change_message(message)
    end
  end
end
