defmodule DigitalOcean.Debug do

  @moduledoc """
  Debug wrappers.
  """

  def get(path) do
    get(path, [])
  end

  def get(path, opts) do
    output DigitalOcean.get(path, opts)
    :ok
  end

  def post(path, data) do
    post(path, data, [])
  end

  def post(path, data, opts) do
    output DigitalOcean.post(path, data, opts)
    :ok
  end

  def put(path, data) do
    put(path, data, [])
  end

  def put(path, data, opts) do
    output DigitalOcean.put(path, data, opts)
    :ok
  end

  def delete(path) do
    delete(path, [])
  end

  def delete(path, opts) do
    output DigitalOcean.put(path, opts)
    :ok
  end

  defp output(response) do
    IO.puts("Status: #{response.status}")
    IO.puts "Headers:"
    Apex.ap response.headers
    IO.puts "Body:"
    Apex.ap response.body
  end

end
