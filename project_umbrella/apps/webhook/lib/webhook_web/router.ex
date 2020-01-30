defmodule WebhookWeb.Router do
  use WebhookWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WebhookWeb do
    pipe_through :api
  end
end
