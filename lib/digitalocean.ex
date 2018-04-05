defmodule DigitalOcean do

  @moduledoc """
  Documentation for DigitalOcean.
  """

  use Tesla, only: [:head, :get, :post, :put, :delete]

  @api_endpoint_default "https://api.digitalocean.com/v2"
  @api_endpoint Application.get_env(:digitalocean, :api_endpoint, @api_endpoint_default)

  @http_follow_redirects Application.get_env(:digitalocean, :http_follow_redirects, true)
  @http_retry_enabled Application.get_env(:digitalocean, :http_retry_enabled, true)
  @http_retry_delay Application.get_env(:digitalocean, :http_retry_delay, 1000)
  @http_retry_max_retries Application.get_env(:digitalocean, :http_retry_max_retries, 5)
  @debug_http Application.get_env(:digitalocean, :debug_http, false)

  plug Tesla.Middleware.Tuples, rescue_errors: :all
  plug Tesla.Middleware.BaseUrl, @api_endpoint
  plug Tesla.Middleware.Headers, %{"Authorization" => "Bearer " <> Application.fetch_env!(:digitalocean, :access_token)}
  plug Tesla.Middleware.JSON
  if @http_retry_enabled do
    plug Tesla.Middleware.Retry, delay: @http_retry_delay, max_retries: @http_retry_max_retries
  end
  if @http_follow_redirects do
    plug Tesla.Middleware.FollowRedirects
  end
  if @debug_http do
    plug Tesla.Middleware.DebugLogger
  end

end
