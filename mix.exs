defmodule WTH.Mixfile do
  use Mix.Project

  def project do
    [ app: :wth,
      version: "0.0.5",
      name: "WTH",
      elixir: "~> 0.14.2",
      escript: [ main_module: WTH ],
      deps: deps ]
  end

  def application do
    [ applications: [ :httpoison,
                      :jsex ] ]
  end

  defp deps do
    [ { :httpoison, github: "edgurgel/httpoison", tag: "0.3.0" },
      { :jsex, "~> 2.0" },
      { :exvcr, github: "parroty/exvcr", tag: "v0.1.7", only: :test } ]
  end
end
