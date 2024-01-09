defmodule Phxtester.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxtesterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phxtester.PubSub},
      # Start Finch
      {Finch, name: Phxtester.Finch},
      # Start the Endpoint (http/https)
      PhxtesterWeb.Endpoint
      # Start a worker by calling: Phxtester.Worker.start_link(arg)
      # {Phxtester.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phxtester.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxtesterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
