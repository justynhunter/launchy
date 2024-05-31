defmodule Launchy.Repo.Migrations.InitialCreate do
  use Ecto.Migration

  def change do
    create table(:project) do
      add :name, :string, null: false
      add :description, :string, null: false
      add :launch_date, :utc_datetime, null: false
      add :is_complete, :boolean, null: false, default: false

      add :created_at, :utc_datetime, null: false, default: fragment("NOW()")
      add :updated_at, :utc_datetime, null: false, default: fragment("NOW()")
    end

    create table(:task_category) do
      add :name, :string, null: false
      add :description, :string, null: false

      add :created_at, :utc_datetime, null: false, default: fragment("NOW()")
      add :updated_at, :utc_datetime, null: false, default: fragment("NOW()")
    end

    create table(:task) do
      add :project_id, references(:project)
      add :task_category_id, references(:task_category)
      add :description, :string, null: false
      add :is_complete, :boolean, null: false, default: false

      add :created_at, :utc_datetime, null: false, default: fragment("NOW()")
      add :updated_at, :utc_datetime, null: false, default: fragment("NOW()")
    end
  end
end
