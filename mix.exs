defmodule DigitalOcean.Mixfile do
  use Mix.Project

  def project do
    [
      app: :digitalocean_api_wrapper,
      version: "0.1.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env == :prod,
      package: package(),
      description: description(),
      deps: deps(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      files: [
        "lib",
        "mix.exs",
        "README*",
        "LICENSE*",
      ],
      maintainers: [
        "Chad Phillips",
      ],
      licenses: [
        "MIT",
      ],
      links: %{
        "GitHub" => "https://github.com/stirlab/elixir-digitalocean",
        "Home" => "http://stirlab.net",
      },
    ]
  end

  defp description do
    """
    Dead simple Elixir wrapper for the DigitalOcean API.
    """
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:tesla, "~> 0.10.0"},
      {:poison, "~> 3.1.0"},
      {:apex, "~>1.2.0"},
    ]
  end
end
