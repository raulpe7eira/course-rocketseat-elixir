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
      detail: %{user: %User{id: "d336107e-57bb-482e-9a30-944ef7ba2d53"}}
    }

    assert response == expected_response
  end
end
