defmodule LaunchyWeb.IndexLive do
  use LaunchyWeb, :live_view

  alias Launchy.Repo
  alias Launchy.Project

  def mount(_params, _session, socket) do
    {:ok, assign(socket, projects: Repo.all(Project))}
  end

  def render(assigns) do
    ~H"""
    <ul class="project-list">
      <%= for project <- @projects do %>
        <li>
          <.link navigate={"/#{project.id}/"}><%= project.name %></.link>
        </li>
      <% end %>
    </ul>
    """
  end
end
