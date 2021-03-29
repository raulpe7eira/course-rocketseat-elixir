defmodule DailyMeals.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias DailyMeals.Meals.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:nome, :cpf, :email]

  @derive {Jason.Encoder, only: @required_params ++ [:id, :meals]}

  schema "users" do
    field :nome, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:cpf])
    |> unique_constraint([:email])
  end
end
