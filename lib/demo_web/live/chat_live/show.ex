defmodule DemoWeb.ChatLive.Show do
  use DemoWeb, :live_view

  alias Demo.ChatExample

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:chat, ChatExample.get_chat!(id))}
  end

  defp page_title(:show), do: "Show Chat"
  defp page_title(:edit), do: "Edit Chat"
end
