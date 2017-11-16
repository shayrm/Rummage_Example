defmodule RummageExampleWeb.PageController do
  use RummageExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
