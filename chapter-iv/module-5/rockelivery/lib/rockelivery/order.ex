defmodule Rockelivery.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Enum
  alias Rockelivery.{Item, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:address, :comments, :payment_method, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id, :items]}

  @payment_methods [:money, :credit_card, :debit_card]

  schema "orders" do
    field :address, :string
    field :comments, :string
    field :payment_method, Enum, values: @payment_methods

    belongs_to :user, User

    many_to_many :items, Item, join_through: "orders_items"

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params, items) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:address, min: 10)
    |> validate_length(:comments, min: 6)
    |> put_assoc(:items, items)
  end
end
