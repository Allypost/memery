defmodule Memery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Memery.Repo,
      # Start the Telemetry supervisor
      MemeryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Memery.PubSub},
      # Start the Endpoint (http/https)
      MemeryWeb.Endpoint
      # Start a worker by calling: Memery.Worker.start_link(arg)
      # {Memery.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Memery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MemeryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
