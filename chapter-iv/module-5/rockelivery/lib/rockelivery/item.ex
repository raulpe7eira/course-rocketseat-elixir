defmodule Rockelivery.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:category, :description, :price, :photo]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  @items_categories [:food, :drink, :desert]

  schema "items" do
    field :category, Enum, values: @items_categories
    field :description, :string
    field :price, :decimal
    field :photo, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
