defmodule Demo.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :datetime, :string
    field :sender, :string
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:sender, :text, :datetime])
    |> validate_required([:sender, :text, :datetime])
  end
end
