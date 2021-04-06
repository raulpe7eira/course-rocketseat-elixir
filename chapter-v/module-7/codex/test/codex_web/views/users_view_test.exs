defmodule CodexWeb.UsersViewTest do
  use CodexWeb.ConnCase, async: true

  import Codex.Factory
  import Phoenix.View

  alias Codex.Users.User
  alias CodexWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created!",
      detail: %{
        user: %User{
          id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
          password: "123456",
          password_hash:
            "$pbkdf2-sha512$160000$3.xrzFZWe0Wa.FDk7byGdg$" <>
              "seXljr/17A0QORwWOf8iRRhXv3G5FG9eBwe3j2sdzKl" <>
              "jLJgKfae2MOGpCIuOuOEiP/DdyBr3WYVN2ALJSR8wNg"
        }
      }
    }

    assert response == expected_response
  end

  test "renders login.json" do
    token = "valid-token"

    response = render(UsersView, "login.json", token: token)

    expected_response = %{token: token}

    assert response == expected_response
  end
end
