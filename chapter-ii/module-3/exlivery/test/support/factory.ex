defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      unity_price: Decimal.new("50.0"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      user_cpf: "65977019092",
      delivery_address: "Rua sem fim",
      items: [
        build(:item),
        build(:item, description: "Temaki de atum", category: :japonesa)
      ],
      total_price: Decimal.new("100.00")
    }
  end

  def user_factory do
    %User{
      name: "Raul",
      address: "Rua sem fim",
      email: "raul@mail.com",
      cpf: "65977019092",
      age: 40
    }
  end
end
