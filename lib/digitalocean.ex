defmodule DigitalOcean do

  @moduledoc """
  Documentation for DigitalOcean.
  """

  @api_endpoint_default "https://api.digitalocean.com/v2"

  use Tesla

  plug Tesla.Middleware.BaseUrl, Application.get_env(:digitalocean, :api_endpoint, @api_endpoint_default)
  plug Tesla.Middleware.Headers, %{"Authorization" => "Bearer " <> Application.get_env(:digitalocean, :access_token)}
  plug Tesla.Middleware.JSON
  if Application.get_env(:digitalocean, :debug_http) do
    plug Tesla.Middleware.DebugLogger
  end

end
