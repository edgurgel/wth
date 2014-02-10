defmodule WTH.Mixfile do
  use Mix.Project

  def project do
    [ app: :wth,
      version: "0.0.2",
      name: "WTH",
      elixir: "~> 0.12.3",
      escript_main_module: WTH,
      deps: deps(Mix.env) ]
  end

  def application do
    [ applications: [ :httpoison,
                      :jsex ] ]
  end

  defp deps(:prod) do
    [ {:httpoison, github: "edgurgel/httpoison" },
      {:jsex, github: "talentdeficit/jsex", ref: "c9df36f07b2089a73ab6b32074c01728f1e5a2e1", override: true } ]
  end
  defp deps(:test) do
    deps(:prod) ++ [ {:exvcr, github: "parroty/exvcr"} ]
  end
  defp deps(:dev), do: deps(:prod)
end
