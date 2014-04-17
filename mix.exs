defmodule WTH.Mixfile do
  use Mix.Project

  def project do
    [ app: :wth,
      version: "0.0.5",
      name: "WTH",
      elixir: "~> 0.12.4",
      escript_main_module: WTH,
      deps: deps(Mix.env) ]
  end

  def application do
    [ applications: [ :httpoison,
                      :jsex ] ]
  end

  defp deps(:prod) do
    [ { :httpoison, github: "edgurgel/httpoison", tag: "0.0.2" },
      { :jsex, github: "talentdeficit/jsex" } ]
  end
  defp deps(:test) do
    deps(:prod) ++ [ {:exvcr, github: "parroty/exvcr"} ]
  end
  defp deps(:dev), do: deps(:prod)
end
