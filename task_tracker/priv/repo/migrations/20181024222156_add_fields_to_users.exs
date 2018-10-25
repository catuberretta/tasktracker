defmodule TaskTracker.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do 
      add :manager_id, references(:user_id, on_delete: :delete_all), default: nil
    end

  end
end
