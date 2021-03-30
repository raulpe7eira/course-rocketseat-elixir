defmodule DailyMeals.Meals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias DailyMeals.Users.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:descricao, :data, :calorias, :user_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field :descricao, :string
    field :data, :naive_datetime
    field :calorias, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(meal \\ %__MODULE__{}, params, user) do
    meal
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:calorias, greater_than_or_equal_to: 0)
    |> unique_constraint([:descricao])
    |> foreign_key_constraint(:user_id)
    |> cast_assoc(:user)
    |> put_assoc(:user, user)
  end
end
