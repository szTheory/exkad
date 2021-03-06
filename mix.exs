defmodule Exkad.Mixfile do
  use Mix.Project

  def project do
    [app: :exkad,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: [main_module: Exkad.Cli],
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger],
      mod: {Exkad, Application.get_env(:exkad, :children, [])}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:eleveldb, github: "basho/eleveldb", tag: "2.2.19"},
      {:uuid, "~> 1.1"}
    ]
  end
end
