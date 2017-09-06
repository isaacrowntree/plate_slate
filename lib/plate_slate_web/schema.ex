defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  # Absinthe.Schema.Notation

  query do
    field :menu_items, list_of(:menu_item) do
      resolve fn _, _, _ ->
        schema = PlateSlate.Menu.Item
        {:ok, PlateSlate.Repo.all(schema)}
      end
    end
  end

  @desc """
    Something to eat off the menu
  """

  object :menu_item do
    field :id, :id
    @desc "Its name"
    field :name, :string
    field :description, :string
    field :price, :float
  end
end
