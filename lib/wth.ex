defmodule WTH do
  use HTTPoison.Base

  def main(args) do
    args |> parse_args |> process |> IO.puts
  end

  defp parse_args(args) do
    options = OptionParser.parse(args, switches: [help: :boolean, random: :boolean],
                                       aliases: [h: :help, r: :random])
    case options do
      { [random: true], _, _ } -> :random
      { [help: true], _, _ } -> :help
      { _, [], _ } -> :help
      { _,  terms , _ } ->
        Enum.join(terms, " ") |> String.strip
    end
  end

  defp process(:random), do: random
  defp process(:help) do
    """
    Usage:
      wth term
    Options:
      -h, [--help]    # Show this help message and quit.
      -r, [--random]  # Get a random term and define it

    Description:
      Search for a definition on Urban Dictionary.
    """
  end
  defp process(""), do: process(:help)
  defp process(term), do: define(term)

  def process_response_body(body)  do
    if JSX.is_json?(body) do
      JSX.decode! body
    else
      body
    end
  end

  def process_request_headers(headers), do: headers ++ [{"User-agent", "WTH"}]

  defp random do
    response = head!("http://www.urbandictionary.com/random.php")
    uri = response.headers["Location"] |> URI.parse
    query = uri.query |> URI.decode_query(%{})
    term = query["term"]
    IO.puts "Random word: #{term}"
    define(term)
  end

  defp define(term) do
    response = get!("http://api.urbandictionary.com/v0/define?" <> URI.encode_query(%{term: term})).body
    if response["result_type"] == "no_results" do
      "Not found"
    else
      first_def = response["list"] |> List.first
      output(first_def)|> IO.ANSI.format(true)
    end
  end

  defp output(%{"definition" => definition, "example" => example}) do
    [definition, "\n\n", :bright, "Example(s):\n\n", :reset, example]
  end
  defp output(%{"definition" => definition}), do: definition
end
