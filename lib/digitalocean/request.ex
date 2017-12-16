defmodule DigitalOcean.Request do

  @moduledoc """
  Documentation for DigitalOcean.Request.
  """

  import DigitalOcean

  def do_head(path) do
    head(path)
  end

  def do_head(path, opts) do
    head(path, opts)
  end

  def do_get(path) do
    get(path)
  end

  def do_get(path, opts) do
    get(path, opts)
  end

  def do_post(path, data) do
    post(path, data)
  end

  def do_post(path, data, opts) do
    post(path, data, opts)
  end

  def do_put(path, data) do
    put(path, data)
  end

  def do_put(path, data, opts) do
    put(path, data, opts)
  end

  def do_delete(path) do
    delete(path)
  end

  def do_delete(path, opts) do
    delete(path, opts)
  end

end

