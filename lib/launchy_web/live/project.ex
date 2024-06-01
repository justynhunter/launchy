defmodule LaunchyWeb.ProjectLive do
  use LaunchyWeb, :live_view

  import Ecto.Query, only: [from: 2]

  alias Launchy.Repo
  alias Launchy.Task

  def mount(params, _session, socket) do
    query = from t in Task, where: t.project_id == ^params["project_id"]

    tasks =
      Repo.all(query)
      |> Repo.preload(:task_category)
      |> Enum.group_by(& &1.task_category, & &1)

    {:ok, assign(socket, tasks: tasks)}
  end

  def render(assigns) do
    ~H"""
    <ul class="project-list">
      <%= for {task_category, tasks} <- @tasks do %>
        <div>
          <h2><%= task_category.name %></h2>
          <ul>
            <%= for task <- tasks do %>
              <li>
                <input
                  type="checkbox"
                  checked={task.is_complete}
                  phx-click="task_checked"
                  phx-value-id={task.id}
                />
                <%= task.description %>
              </li>
            <% end %>
          </ul>
        </div>
      <% end %>
    </ul>
    """
  end

  def handle_event("task_checked", %{"id" => id}, socket) do
    {id, _} = Integer.parse(id)
    task = Repo.get!(Task, id)
    task = Ecto.Changeset.change(task, is_complete: !task.is_complete)
    Repo.update!(task)

    {:noreply, socket}
  end
end
