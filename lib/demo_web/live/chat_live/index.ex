defmodule DemoWeb.ChatLive.Index do
  use DemoWeb, :live_view

  alias Demo.ChatExample
  alias Demo.ChatExample.Chat

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Demo.ChatExample.subscribe()
    end

    {:ok, assign(socket, :chats, list_chats())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Chat")
    |> assign(:chat, ChatExample.get_chat!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Chat")
    |> assign(:chat, %Chat{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Chats")
    |> assign(:chat, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    chat = ChatExample.get_chat!(id)
    {:ok, _} = ChatExample.delete_chat(chat)

    {:noreply, assign(socket, :chats, list_chats())}
  end

  @impl true
  def handle_info({:chat_created, chat}, socket) do
    {:noreply, update(socket, :chats, fn chats -> [chat | chats] end)}
  end

  defp list_chats do
    ChatExample.list_chats()
  end
end
