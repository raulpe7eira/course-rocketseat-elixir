# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rockelivery.Repo.insert!(%Rockelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rockelivery.{Item, Order, Repo, User}

user = %User{
  age: 27,
  address: "Rua X, 123",
  cep: "12345678",
  cpf: "47971092032",
  email: "raul@mail.com",
  password: "123456",
  name: "Raul Pereira"
}

%User{id: user_id} = Repo.insert!(user)

item1 = %Item{
  category: :food,
  description: "Ovo com banana",
  price: Decimal.new("25.00"),
  photo: "/priv/photos/ovo_com_banana.jpg"
}

item2 = %Item{
  category: :food,
  description: "Banana com ovo",
  price: Decimal.new("25.00"),
  photo: "/priv/photos/banana_com_ovo.jpg"
}

Repo.insert!(item1)
Repo.insert!(item2)

order = %Order{
  address: "Rua Y, 123",
  comments: "Sem canela",
  payment_method: :credit_card,
  user_id: user_id,
  items: [item1, item1, item2]
}

Repo.insert!(order)
