defmodule Launchy.Task do
  use Ecto.Schema

  schema "task" do
    field :description, :string
    field :is_complete, :boolean

    belongs_to :project, Launchy.Project
    belongs_to :task_category, Launchy.TaskCategory

    field :created_at, :utc_datetime
    field :updated_at, :utc_datetime
  end
end
