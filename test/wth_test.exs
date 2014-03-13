defmodule WTH.WTHTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import ExUnit.CaptureIO

  test "call WTH with an empty argument" do
    assert capture_io(fn -> WTH.main([""]) end) =~ %r/Usage:/
  end

  test "call WTH without an argument" do
    assert capture_io(fn -> WTH.main([]) end) =~ %r/Usage:/
  end

  test "call WTH with one word argument" do
    use_cassette "urbandict_1_term" do
      assert capture_io(fn -> WTH.main(["wth"]) end) =~ %r/What the Hell/
    end
  end

  test "call WTH with two words argument" do
    use_cassette "urbandict_2_terms" do
      assert capture_io(fn -> WTH.main(["banana", "boat"]) end) =~ %r/an all male gay cruise/
    end
  end
end
