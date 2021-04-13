defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Item, Order}

  def create(filename \\ "report.csv") do
    order_list = build_order_list()

    File.write(filename, order_list)
  end

  defp build_order_list do
    OrderAgent.get_all()
    |> Map.values()
    |> Enum.map(fn order -> order_string(order) end)
  end

  defp order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    items_string = Enum.reduce(items, "", &item_string(&1, &2))
    "#{cpf},#{items_string},#{total_price}\n"
  end

  defp item_string(%Item{category: category, quantity: quantity, unity_price: unity_price}, acc) do
    "#{separate_acc(acc)}#{category},#{quantity},#{unity_price}"
  end

  defp separate_acc(acc) do
    if acc != "", do: "#{acc},", else: acc
  end
end
