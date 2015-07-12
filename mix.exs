defmodule WTH.Mixfile do
  use Mix.Project

  def project do
    [ app: :wth,
      version: "0.0.5",
      name: "WTH",
      elixir: "~> 1.0",
      escript: [ main_module: WTH ],
      deps: deps ]
  end

  def application do
    [ applications: [ :httpoison,
                      :exjsx ] ]
  end

  defp deps do
    [ { :httpoison, "~> 0.5.0" },
      { :exjsx, "~> 3.0" },
      { :meck, "~> 0.8.2", only: :test },
      { :exvcr, "~> 0.3.0", only: :test } ]
  end
end
