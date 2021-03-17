defmodule Flightex.Users.Create do
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    name
    |> User.build(email, cpf)
    |> handle_save()
  end

  defp handle_save({:ok, %User{} = user}) do
    UserAgent.save(user)
  end

  defp handle_save({:error, _reason} = error), do: error
end
