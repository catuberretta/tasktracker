defmodule TaskTrackerWeb.TaskController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Tasks
  alias TaskTracker.Tasks.Task
  alias TaskTracker.Users

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
        users = Users.list_users()
    render(conn, "index.html", tasks: tasks, users: users)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    users = Users.list_users()
    render(conn, "new.html", users: users, assignedTo: false, changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", assignedTo: false, changeset: changeset, )
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    users = Users.list_users()
    render(conn, "show.html", task: task, users: users)
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    users = Users.list_users()
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, assignedTo: task.assignedUser, users: users, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)
    users = Users.list_users()
    
    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, users: users, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
