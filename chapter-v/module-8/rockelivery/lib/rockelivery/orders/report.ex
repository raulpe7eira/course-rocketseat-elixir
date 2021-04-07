defmodule Rockelivery.Orders.Report do
  import Ecto.Query

  alias Rockelivery.{Item, Order, Repo}

  @default_block_size 500

  def create(filename \\ "report.csv") do
    query = from order in Order, order_by: order.user_id

    {:ok, order_list} =
      Repo.transaction(
        fn ->
          query
          |> Repo.stream(max_rows: @default_block_size)
          |> Stream.chunk_every(@default_block_size)
          |> Stream.flat_map(fn chunk -> Repo.preload(chunk, :items) end)
          |> Enum.map(&parse_order/1)
        end,
        timeout: :infinity
      )

    File.write(filename, order_list)
  end

  defp parse_order(%Order{user_id: user_id, payment_method: payment_method, items: items}) do
    parsed_item = Enum.map(items, &parse_item/1)
    total_price = calculate_total_price(items)

    "#{user_id},#{payment_method},#{parsed_item}#{total_price}\n"
  end

  defp parse_item(%Item{category: category, description: description, price: price}) do
    "#{category},#{description},#{price},"
  end

  defp calculate_total_price(items) do
    Enum.reduce(items, Decimal.new("0.00"), fn %Item{price: price}, acc ->
      Decimal.add(price, acc)
    end)
  end
end
