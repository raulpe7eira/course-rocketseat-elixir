defmodule ListFilterTest do
  use ExUnit.Case

  describe "call/1" do
    test "returns the odd count" do
      list = ["1", "3", "6", "43", "banana", "6", "abc"]
      expected = 3

      assert ListFilter.call(list) == expected
    end
  end
end
