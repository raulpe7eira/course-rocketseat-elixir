defmodule Exlivery do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder
  alias Exlivery.Orders.Report
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_report_for_all_orders(filename), to: Report, as: :create
end
