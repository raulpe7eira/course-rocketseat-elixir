defmodule Codex.Github.Response do
  @keys [:id, :name, :description, :html_url, :stargazers_count]

  @derive Jason.Encoder
  @enforce_keys @keys
  defstruct @keys

  def build(%{
        "id" => id,
        "name" => name,
        "description" => description,
        "html_url" => html_url,
        "stargazers_count" => stargazers_count
      }) do
    %__MODULE__{
      id: id,
      name: name,
      description: description,
      html_url: html_url,
      stargazers_count: stargazers_count
    }
  end
end
