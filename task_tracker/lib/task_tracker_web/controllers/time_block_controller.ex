defmodule TaskTrackerWeb.TimeBlockController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.TimeBlocks
  alias TaskTracker.TimeBlocks.TimeBlock

  action_fallback TaskTrackerWeb.FallbackController

  def index(conn, _params) do
    timeblocks = TimeBlocks.list_timeblocks()
    render(conn, "index.json", timeblocks: timeblocks)
  end

  def create(conn, %{"time_block" => time_block_params}) do
    case TimeBlocks.create_time_block(time_block_params) do
      {:ok, time_block} ->
        IO.puts"SUCCESSFUL"
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.time_block_path(conn, :show, time_block))
        |> render("show.json", time_block: time_block)
      {other_status, reason} ->
        IO.inspect("GOT OTHER STATUS: #{other_status} #{reason}")
    end
  end

  def show(conn, %{"id" => id}) do
    time_block = TimeBlocks.get_time_block!(id)
    render(conn, "show.json", time_block: time_block)
  end

  def update(conn, %{"id" => id, "time_block" => time_block_params}) do
    time_block = TimeBlocks.get_time_block!(id)

    with {:ok, %TimeBlock{} = time_block} <- TimeBlocks.update_time_block(time_block, time_block_params) do
      render(conn, "show.json", time_block: time_block)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_block = TimeBlocks.get_time_block!(id)

    with {:ok, %TimeBlock{}} <- TimeBlocks.delete_time_block(time_block) do
      send_resp(conn, :no_content, "")
    end
  end
end
