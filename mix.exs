defmodule WTH.Mixfile do
  use Mix.Project

  def project do
    [ app: :wth,
      version: "0.0.5",
      name: "WTH",
      elixir: "~> 0.14.2 or ~> 0.15.0",
      escript: [ main_module: WTH ],
      deps: deps ]
  end

  def application do
    [ applications: [ :httpoison,
                      :jsex ] ]
  end

  defp deps do
    [ { :httpoison, "~> 0.3.0" },
      { :hackney,   github: "benoitc/hackney", tag: "0.13.0" },
      { :jsex, "~> 2.0" },
      { :meck, "0.8.2", github: "eproxus/meck", override: true, only: :test },
      { :exvcr, "~> 0.3.0", only: :test } ]
  end
end
