# PhoenixComposable

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

# Gens
`mix phx.gen.json Cars Car cars color:string vin_number:string`
`mix phx.gen.context Cars Engine engines name:string cylinders:integer horse_power:integer`
`mix phx.gen.context Cars Transmission transmissions type:string`
`mix phx.gen.context Cars Specification specifications engine_id:references:engines transmission_id:references:transmissions`
