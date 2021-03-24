defmodule DailyMealsWeb.ErrorView do
  use DailyMealsWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Ecto.Changeset

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("error.json", %{detail: %Changeset{} = changeset}) do
    %{message: "Falha na requisição!", detail: translate_errors(changeset)}
  end

  def render("error.json", %{detail: detail}) do
    %{message: "Falha na requisição!", detail: detail}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}", to_string(value))
      end)
    end)
  end
end
