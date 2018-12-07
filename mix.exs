defmodule ETS.Ecto.Mixfile do
  use Mix.Project

  def project do
    [app: :ets_ecto,
    version: "0.0.1",
    elixir: "~> 1.7",
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env() == :prod,
    deps: deps()]
  end

  def application do
    [applications: [:ecto, :logger]]
  end

  defp deps do
    [{:ecto, "~> 3.0"}]
  end
end
