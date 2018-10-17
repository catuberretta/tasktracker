defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :assignedUser, :string
    field :completed, :boolean, default: false
    field :desc, :string
    field :timeSpent, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :completed, :assignedUser, :timeSpent])
    |> validate_required([:title, :desc, :completed, :assignedUser, :timeSpent])
  end
end
