# Overview

Dead simple Elixir wrapper for the
[DigitalOcean API](https://developers.digitalocean.com/documentation/v2).

## Installation (for now)


```elixir
def deps do
  [
    {:digitalocean, git: "https://github.com/stirlab/elixir-digitalocean.git"},
  ]
end
```

```sh
cp config/config.sample.exs config/config.exs
```

Edit to taste.

## Usage

The library leverages the [Tesla](https://github.com/teamon/tesla) HTTP
library, and for now this library simply wraps the Tesla get/post/etc methods
directly.

The path and request parameters can be figured out via DigitalOcean's
[API](https://developers.digitalocean.com/documentation/v2).

### Examples

```elixir
# Get account info.
response = DigitalOcean.get "/account"
IO.puts response.status
IO.inspect response.headers
IO.inspect response.body

# Get images.
response = DigitalOcean.get("/images", query: [per_page: 200])
Enum.each response.body["images"], fn image ->
  IO.inspect image
end

# Create droplet.
configuration = %{
  image: 30035107,
  name: "my-debian-stretch",
  region: "nyc3",
  size: "512mb",
  private_networking: false,
  ipv6: false,
  backups: false,
  monitoring: false,
  tags: [
    "video",
  ],
}
response = DigitalOcean.post("/droplets", configuration)

# Rename droplet.
id = 75372859
response = DigitalOcean.post("/droplets/#{id}/actions", %{:type => "rename", :name => "updated-debian-stretch"})

# Delete droplet.
id = 75372859
response = DigitalOcean.delete("/droplets/#{id}")

```
