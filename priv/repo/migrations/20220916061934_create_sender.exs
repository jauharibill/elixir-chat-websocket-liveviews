defmodule Demo.Repo.Migrations.CreateSender do
  use Ecto.Migration

  def change do
    create table(:sender) do
      add :body, :text

      timestamps()
    end
  end
end
