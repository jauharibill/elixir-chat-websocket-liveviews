defmodule Demo.ChatDOT.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sender" do
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(chat, attrs) do
    chat
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
