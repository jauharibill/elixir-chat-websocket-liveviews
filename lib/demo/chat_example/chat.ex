defmodule Demo.ChatExample.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field :body, :string
    field :sender, :string

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:sender, :body])
    |> validate_required([:sender, :body])
  end
end
