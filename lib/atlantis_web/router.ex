defmodule AtlantisWeb.Router do
  use AtlantisWeb, :router

  alias Atlantis.Guardian

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/", AtlantisWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  scope "/api", AtlantisWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
    scope "/secure" do
      pipe_through :jwt_authenticated
      resources "/users", UserController, only: [:show]
    end
    
  end
end
