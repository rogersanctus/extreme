defmodule Extreme.Mixfile do
  use Mix.Project

  def project do
    [
      app: :extreme,
      version: "1.0.2",
      elixir: "~> 1.7",
      elixirc_paths: _elixirc_paths(Mix.env()),
      source_url: "https://github.com/exponentially/extreme",
      description: """
      Elixir TCP client for EventStore.
      """,
      package: _package(),
      start_permanent: Mix.env() == :prod,
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ],
      deps: _deps(),
      test_coverage: _test_coverage()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :inets]
    ]
  end

  # Specifies which paths to compile per environment.
  defp _elixirc_paths(:test), do: ["lib", "test/support"]
  defp _elixirc_paths(_), do: ["lib"]

  defp _deps do
    [
      {:protobuf, "~> 0.11"},
      {:elixir_uuid, "~> 1.2"},
      {:telemetry, "~> 0.4 or ~> 1.0"},
      # needed when connecting to EventStore cluster (node_type: :cluster | :cluster_dns)
      {:jason, "~> 1.1", optional: true},

      # testing
      {:exvcr, "~> 0.10", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev},
      # {:excoveralls, "~> 0.9", only: :test},
      {:credo, "~> 1.7", only: :dev}
    ]
  end

  defp _package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "include"],
      maintainers: ["Milan Burmaja"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/exponentially/extreme"}
    ]
  end

  defp _test_coverage do
    [
      summary: [threshold: 70]
    ]
  end
end
