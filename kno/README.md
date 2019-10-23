# Kno

**Simple and secure passwordless authentication using magic links and device authentication**

Quickly integrate with the [Kno authentication service](trykno.com).

*Try out the [device authentication flow](trykno.app)*

## Installation

Add Kno to your list of dependencies `mix.exs`:

```elixir
def deps do
  [
    {:kno, "~> 0.1.0"}
  ]
end
```

Run `mix deps.get` to install it.

Errors are hard, buttons are hard

## Getting Started

### Phoenix application


```elixir
use Kno.Plug,
  # We could use the site_id as the key kno_site_adadfadf
  # site_id, site_secret
  site_token: "aigig",
  api_token: "good",

  sign_in: "/sign-in",
  sign_out: "/sign-out"
```
How does Pow decide where to redirect authenticated users too?
-> referrer or home
https://github.com/danschultzer/pow/blob/a13b08030b9b6308b5eb0de06644129558acbe0a/README.md#callback-routes

This should have Kno.Plug.SignIn, SignOut
This needs to add to the private fields kno_config

Take maybe user from private and put it in assigns

https://hexdocs.pm/phoenix/Phoenix.Controller.html#module-guards

```elixir
plug :require_user, when action

# require account
def require_persona(conn, params) do
  # expects conn to have the :kno_config private key
  case Kno.Plug.get_persona(conn) do
    nil ->
      redirect to authenticate
      halt
      Kno.Plug.request_auth() # does both the above
    persona_id ->
      assign(conn, persona_id: persona_id)
  end
end
```

### Direct API usage

Kno.API.verify_token()
