defmodule DigitalOcean do

  @moduledoc """
  Documentation for DigitalOcean.
  """

  use Tesla, only: [:head, :get, :post, :put, :delete]

  @api_endpoint_default "https://api.digitalocean.com/v2"

  if Application.get_env(:digitalocean_api_wrapper, :enable_tesla_log, false) do
    plug Tesla.Middleware.Logger
  end
  plug Tesla.Middleware.BaseUrl, Application.get_env(:digitalocean_api_wrapper, :api_endpoint, @api_endpoint_default)
  plug Tesla.Middleware.Headers, [{"Authorization", "Bearer " <> Application.fetch_env!(:digitalocean_api_wrapper, :access_token)}]
  plug Tesla.Middleware.JSON
  if Application.get_env(:digitalocean_api_wrapper, :http_retry_enabled, true) do
    plug Tesla.Middleware.Retry, delay: Application.get_env(:digitalocean_api_wrapper, :http_retry_delay, 1000), max_retries: Application.get_env(:digitalocean_api_wrapper, :http_retry_max_retries, 5)
  end
  if Application.get_env(:digitalocean_api_wrapper, :http_follow_redirects, true) do
    plug Tesla.Middleware.FollowRedirects
  end

end
