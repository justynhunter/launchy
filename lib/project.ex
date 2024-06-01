defmodule Launchy.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project" do
    field :name, :string
    field :description, :string
    field :launch_date, :date
    field :is_complete, :boolean
    field :created_at, :utc_datetime
    field :updated_at, :utc_datetime

    has_many :tasks, Launchy.Task
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :launch_date, :is_complete])
    |> validate_required([:name, :description])
  end
end
