defmodule Super.MixProject do
  use Mix.Project

  def project do
    [
      app: :super,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Super.Application, []}, extra_applications: [:cowboy, :plug]
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.1.2"},
      {:plug, "~> 1.3.4"},
      {:httpoison, "~> 1.5"}
    ]
  end
end
