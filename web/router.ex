defmodule HelloPhoenix.Router do
  use Phoenix.Router

  pipeline :api do
    plug CORSPlug, [origin: "http://localhost:4200", methods: "GET, POST, PUT, DELETE"]
    plug :accepts, ["json"]
  end

  scope "/api", HelloPhoenix do
    pipe_through :api
    resources "contacts", ContactController
  end

end
