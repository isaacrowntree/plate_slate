defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  # Absinthe.Schema.Notation

  alias PlateSlateWeb.Resolvers

  query do
    field :menu_items, list_of(:menu_item) do
      arg :matching, :string
      resolve &Resolvers.Menu.menu_items/3
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
