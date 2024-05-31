defmodule Launchy.Project do
  use Ecto.Schema

  schema "project" do
    field :name, :string
    field :description, :string
    field :launch_date, :utc_datetime
    field :is_complete, :boolean
    field :created_at, :utc_datetime
    field :updated_at, :utc_datetime

    has_many :tasks, Launchy.Task
  end
end
