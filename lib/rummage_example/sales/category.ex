defmodule RummageExample.Sales.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias RummageExample.Sales.Category


  schema "categories" do
    field :category_name, :string

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:category_name])
    |> validate_required([:category_name])
  end
end
