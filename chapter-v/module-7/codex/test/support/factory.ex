defmodule Codex.Factory do
  use ExMachina.Ecto, repo: Codex.Repo

  alias Codex.Github.Response
  alias Codex.Users.User

  def repo_factory do
    %Response{
      id: 161_263_070,
      name: "benchmark",
      description: "Prospecting the libs benchmark",
      html_url: "https://github.com/raulpe7eira/benchmark",
      stargazers_count: 0
    }
  end

  def login_params_factory do
    %{
      id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
      password: "123456"
    }
  end

  def user_params_factory do
    %{
      password: "123456"
    }
  end

  def user_factory do
    %User{
      id: "d336107e-57bb-482e-9a30-944ef7ba2d53",
      password: "123456",
      password_hash:
        "$pbkdf2-sha512$160000$3.xrzFZWe0Wa.FDk7byGdg$" <>
          "seXljr/17A0QORwWOf8iRRhXv3G5FG9eBwe3j2sdzKl" <>
          "jLJgKfae2MOGpCIuOuOEiP/DdyBr3WYVN2ALJSR8wNg"
    }
  end
end
