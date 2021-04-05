defmodule Codex.Factory do
  use ExMachina

  alias Codex.Github.Response

  def repo_factory do
    %Response{
      id: 161_263_070,
      name: "benchmark",
      description: "Prospecting the libs benchmark",
      html_url: "https://github.com/raulpe7eira/benchmark",
      stargazers_count: 0
    }
  end
end
