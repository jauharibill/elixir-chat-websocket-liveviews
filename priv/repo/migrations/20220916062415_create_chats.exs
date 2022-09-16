defmodule Demo.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :sender, :string
      add :body, :text

      timestamps()
    end
  end
end
