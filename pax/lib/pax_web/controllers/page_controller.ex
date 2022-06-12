defmodule PaxWeb.PageController do
  use PaxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
