defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :assignedUser, :integer
    field :completed, :boolean, default: false
    field :desc, :string
    field :timeSpent, :integer
    field :title, :string
    has_many :timeblocks, TaskTracker.TimeBlocks.TimeBlock

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :completed, :assignedUser, :timeSpent])
    |> validate_required([:title, :desc])
  end
end
