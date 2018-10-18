defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :desc, :text
      add :completed, :boolean, default: false, null: false
      add :assignedUser, references(:users, on_delete: :delete_all), null: false
      add :timeSpent, :integer

      timestamps()
    end

  end
end
