defmodule Demo.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :sender, :string
      add :text, :string
      add :datetime, :string

      timestamps()
    end
  end
end
