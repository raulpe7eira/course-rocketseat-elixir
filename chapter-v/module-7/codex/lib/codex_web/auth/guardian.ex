defmodule CodexWeb.Auth.Guardian do
  use Guardian, otp_app: :codex

  alias Codex.Error
  alias Codex.Users.User
  alias Codex.Users.Retrieve, as: RetrieveUser

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    user =
      claims
      |> Map.get("sub")
      |> RetrieveUser.call()

    {:ok, user}
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- RetrieveUser.call(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please verify your credentials!")}
      error -> error
    end
  end

  def authenticate(_), do: {:error, Error.build(:bad_request, "Invalid or missing params!")}
end
