defmodule DailyMeals.Meals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:descricao, :data, :calorias]

  @derive {Jason.Encoder, only: [:id, :descricao, :data, :calorias]}

  schema "meals" do
    field :descricao, :string
    field :data, :utc_datetime
    field :calorias, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:calorias, greater_than_or_equal_to: 0)
    |> unique_constraint([:descricao])
  end
end
