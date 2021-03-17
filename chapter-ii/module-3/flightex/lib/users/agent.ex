defmodule Flightex.Users.Agent do
  use Agent

  alias Flightex.Users.User

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user) do
    user = %{user | id: UUID.uuid4()}

    Agent.update(__MODULE__, &update_state(&1, user))

    {:ok, user.id}
  end

  defp update_state(state, %User{} = user), do: Map.put(state, user.id, user)

  def get(id), do: Agent.get(__MODULE__, &get_user(&1, id))

  defp get_user(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
