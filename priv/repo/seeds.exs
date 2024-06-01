# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Launchy.Repo.insert!(%Launchy.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Launchy.Repo
alias Launchy.Project
alias Launchy.TaskCategory
alias Launchy.Task

unless Repo.exists?(TaskCategory) do
  project = %Project{
    name: "Fake Project",
    description: "This is a placeholder project to get started",
    launch_date: ~D[2024-12-25]
  }
  project = Repo.insert!(project)

  prelaunch_cat = %TaskCategory{
    name: "Prelaunch",
    description: "Tasks that need to be completed before the day of launch",
  }
  day_of_cat = %TaskCategory{
    name: "Day Of",
    description: "Tasks that need to be completed on the day of launch",
  }
  during_launch_cat = %TaskCategory{
    name: "During Launch",
    description: "Tasks that need to be completed during the launch",
  }
  post_launch_cat = %TaskCategory{
    name: "Post Launch",
    description: "Tasks that need to be completed after the launch",
  }

  prelaunch_cat = Repo.insert!(prelaunch_cat)
  day_of_cat = Repo.insert!(day_of_cat)
  during_launch_cat = Repo.insert!(during_launch_cat)
  post_launch_cat = Repo.insert!(post_launch_cat)
  
  task1 = %Task{
    description: "Prelaunch Task",
    project_id: project.id,
    task_category_id: prelaunch_cat.id
  }
  task2 = %Task{
    description: "Launch Task 1",
    project_id: project.id,
    task_category_id: during_launch_cat.id
  }
  task3 = %Task{
    description: "Launch Task 2",
    project_id: project.id,
    task_category_id: during_launch_cat.id
  }
  task4 = %Task{
    description: "Launch Task 3",
    project_id: project.id,
    task_category_id: during_launch_cat.id
  }
  task5 = %Task{
    description: "Post Launch Task",
    project_id: project.id,
    task_category_id: post_launch_cat.id
  }
  Repo.insert!(task1)
  Repo.insert!(task2)
  Repo.insert!(task3)
  Repo.insert!(task4)
  Repo.insert!(task5)
end
