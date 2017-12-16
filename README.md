# DigitalOcean wrapper

Dead simple Elixir wrapper for the [DigitalOcean](https://www.digitalocean.com)
API.

This uses version 2 of their
[API]((https://developers.digitalocean.com/documentation/v2) by default.

**NOTE:** Almost nothing in here right now, only very basic functions have been
implemented for their DNS Manager functionality. Pull requests welcome to add
other stuff :)

## Installation (for now)


```elixir
def deps do
  [
    {:digitalocean, git: "https://github.com/thehunmonkgroup/elixir-digitalocean.git"},
  ]
end
```

```sh
cp config/config.sample.exs config/config.exs
```

Edit to taste.

## Usage

The library leverages the [Tesla](https://github.com/teamon/tesla) HTTP
library, and for now you simply call the Tesla get/post/etc methods directly.

The path and request parameters can be figured out via DigitalOcean's
[API]((https://developers.digitalocean.com/documentation/v2).
