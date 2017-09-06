defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  # Absinthe.Schema.Notation

  alias PlateSlateWeb.Resolvers

  query do
    field :menu_items, list_of(:menu_item) do
      arg :filter, :menu_items_filter
      arg :order, :sort_order, default_value: :asc
      resolve &Resolvers.Menu.menu_items/3
    end
  end

  enum :sort_order do
    value :asc
    value :desc
  end

  input_object :menu_items_filter do
    field :matching, :string
    field :priced_above, :decimal
    field :priced_below, :decimal
  end

  scalar :decimal do
    parse fn input ->
      input.value |> Decimal.parse
    end

    serialize fn value ->
      to_string(value)
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
    field :price, :decimal
  end
end
