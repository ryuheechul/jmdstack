defmodule Pax.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pax.Repo,
      # Start the Telemetry supervisor
      PaxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pax.PubSub},
      # Start the Endpoint (http/https)
      PaxWeb.Endpoint
      # Start a worker by calling: Pax.Worker.start_link(arg)
      # {Pax.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pax.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PaxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
