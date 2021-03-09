defmodule ListFilter do
  require Integer

  def call(list) do
    list
    |> Enum.filter(fn element -> Integer.parse(element) != :error end)
    |> Enum.count(fn element -> String.to_integer(element) |> Integer.is_odd() end)
  end
end
