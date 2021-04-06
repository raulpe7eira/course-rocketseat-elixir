defmodule CodexWeb.Router do
  use CodexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug CodexWeb.Auth.Pipeline
  end

  scope "/api", CodexWeb do
    pipe_through :api

    resources "/users", UsersController, only: [:create]
    post "/users/login", UsersController, :login
  end

  scope "/api", CodexWeb do
    pipe_through [:api, :auth]

    resources "/repos/github/users", ReposController, only: [:show]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: CodexWeb.Telemetry
    end
  end
end
