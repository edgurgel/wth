defmodule WTH.Mixfile do
  use Mix.Project

  def project do
    [ app: :wth,
      version: "0.0.5",
      name: "WTH",
      elixir: "~> 0.13.3",
      escript_main_module: WTH,
      deps: deps ]
  end

  def application do
    [ applications: [ :httpoison,
                      :jsex ] ]
  end

  defp deps do
    [ { :httpoison, github: "edgurgel/httpoison", tag: "0.1.1" },
      { :jsex, "~> 2.0" },
      { :exvcr, github: "parroty/exvcr", tag: "v0.1.6", only: :test } ]
  end
end
