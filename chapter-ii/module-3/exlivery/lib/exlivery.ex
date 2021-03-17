defmodule Exlivery do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateOrder
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
end
