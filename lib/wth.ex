defmodule WTH do
  use HTTPoison.Base

  def main(args) do
    args |> parse_args |> process |> IO.puts
  end

  defp parse_args(args) do
    options = OptionParser.parse(args, switches: [help: :boolean], aliases: [h: :help])
    case options do
      { [help: true], _, _ } -> :help
      { _, [ term ], _ } -> term
    end
  end

  defp process(:help) do
    """
    Usage:
      wth term
    Options:
      -h, [--help]  # Show this help message and quit.

    Description:
      Search for a definition on Urban Dictionary.
    """
  end
  defp process(term), do: define(term)

  def process_url(url) do
    "http://api.urbandictionary.com/v0/" <> url
  end

  def process_response_body(body), do: JSEX.decode! body
  def process_request_headers(headers), do: headers ++ [{"User-agent", "WTH"}]

  def define(term) do
    response = get("define?term=" <> term).body
    if response["result_type"] == "no_results" do
      "Not found"
    else
      first_def = response["list"] |> List.first
      first_def["definition"]
    end
  end
end
