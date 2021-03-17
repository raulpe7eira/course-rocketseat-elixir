defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent

  describe "save/1" do
    test "saves the order" do
      OrderAgent.start_link(%{})

      order = build(:order)

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      {:ok, order: order, uuid: uuid}
    end

    test "when the order is found, returns the order", %{order: order, uuid: uuid} do
      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = OrderAgent.get("non-order")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
