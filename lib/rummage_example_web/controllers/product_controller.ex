defmodule RummageExampleWeb.ProductController do
  use RummageExampleWeb, :controller
  # must be added for the Rummage app to work
  import Ecto.Query, warn: false
  alias RummageExample.Repo

  alias RummageExample.Sales
  alias RummageExample.Sales.Product

  def index(conn, params) do
    #products = Sales.list_products()
    #the default_per_page was set to 2
    # The original query will be modified for Rummage pagination
    Sales.list_products() 
    {query, _rummage} = Product
    |> Product.rummage(params["rummage"])

    products = query
        |> Repo.all()
        |> Repo.preload(:category)   
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Sales.change_product(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    case Sales.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: product_path(conn, :show, product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Sales.get_product!(id)
    render(conn, "show.html", product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = Sales.get_product!(id)
    changeset = Sales.change_product(product)
    render(conn, "edit.html", product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Sales.get_product!(id)

    case Sales.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: product_path(conn, :show, product))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Sales.get_product!(id)
    {:ok, _product} = Sales.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: product_path(conn, :index))
  end
end
