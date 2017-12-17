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

  defdelegate head(path), to: __MODULE__, as: :head
  defdelegate head(path, opts), to: __MODULE__, as: :head

  defdelegate get(path), to: __MODULE__, as: :get
  defdelegate get(path, opts), to: __MODULE__, as: :get

  defdelegate post(path), to: __MODULE__, as: :post
  defdelegate post(path, opts), to: __MODULE__, as: :post

  defdelegate put(path), to: __MODULE__, as: :put
  defdelegate put(path, opts), to: __MODULE__, as: :put

  defdelegate delete(path), to: __MODULE__, as: :delete
  defdelegate delete(path, opts), to: __MODULE__, as: :delete

end
