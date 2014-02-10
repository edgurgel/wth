defmodule WTH.WTHTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "one word term definition" do
    use_cassette "urbandict_1_term" do
      assert WTH.define("wth") =~ %r/What the Hell/
    end
  end

  test "more than 1 word term" do
    use_cassette "urbandict_2_terms" do
      assert WTH.define("banana boat") =~ %r/an all male gay cruise/
    end
  end
end
