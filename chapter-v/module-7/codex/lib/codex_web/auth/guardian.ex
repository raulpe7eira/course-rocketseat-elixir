defmodule CodexWeb.Auth.Guardian do
  use Guardian, otp_app: :codex

  alias Codex.Error
  alias Codex.Users.User
  alias Codex.Users.Retrieve, as: RetrieveUser

  @ttl_login {1, :minute}

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
         {:ok, token, _claims} <- encode_and_sign(user, %{}, ttl: @ttl_login) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please verify your credentials!")}
      error -> error
    end
  end

  def authenticate(_), do: {:error, Error.build(:bad_request, "Invalid or missing params!")}

  def refresh_token(%{"token" => token}) do
    with {:ok, _old_stuff, {new_token, _new_claims}} <- refresh(token, ttl: @ttl_login) do
      {:ok, new_token}
    else
      {:error, reason} -> {:error, Error.build(:unauthorized, reason)}
    end
  end

  def refresh_token(_), do: {:error, Error.build(:bad_request, "Invalid or missing params!")}
end
