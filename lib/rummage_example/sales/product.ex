defmodule RummageExample.Sales.Product do
  use Ecto.Schema
  use Rummage.Ecto
  import Ecto.Changeset
  alias RummageExample.Sales.Product


  schema "products" do
    field :name, :string
    field :price, :integer
    #field :category_id, :string
    belongs_to :category, RummageExample.Sales.Category

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
