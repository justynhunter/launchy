defmodule LaunchyWeb.ProjectEditLive do
  use LaunchyWeb, :live_view

  alias Launchy.Repo
  alias Path
  alias Launchy.Project
  import Ecto.Changeset

  def render(assigns) do
    ~H"""
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1>Edit Project</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <.form for={@form} phx-change="validate" phx-submit="save">
            <.input label="Name" field={@form[:name]} type="text" class="form-control" />
            <.input label="Description" field={@form[:description]} type="text" class="form-control" />
            <.input label="Launch Date" field={@form[:launch_date]} type="date" class="form-control" />

            <button>Save</button>
          </.form>
        </div>
      </div>
    </div>
    """
  end

  def changeset(project, attrs \\ %{}) do
    project
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end

  def mount(_params, _session, socket) do
    changeset = Project.changeset(%Project{})
    {:ok, assign(socket, form: to_form(changeset))}
  end

  def handle_event("validate", %{"project" => params}, socket) do
    changeset = Project.changeset(%Project{}, params)

    {:noreply, assign(socket, form: to_form(changeset))}
  end

  def handle_event("save", %{"project" => params}, socket) do
    changeset = Project.changeset(%Project{}, params)

    case Repo.insert(changeset) do
      {:ok, project} ->
        {:noreply, redirect(socket, to: "/project/#{project.id}")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
