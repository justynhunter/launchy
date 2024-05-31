defmodule Launchy.TaskCategory do
  use Ecto.Schema

  schema "task_category" do
    field :name, :string
    field :description, :string
    field :created_at, :utc_datetime
    field :updated_at, :utc_datetime

    has_many :tasks, Launchy.Task
  end
end
