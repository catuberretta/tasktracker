defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :username, :string
    field :manager_id, :integer
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :manager_id])
    |> unique_constraint(:username)
    |> validate_required([:username, :manager_id])
  end
end
