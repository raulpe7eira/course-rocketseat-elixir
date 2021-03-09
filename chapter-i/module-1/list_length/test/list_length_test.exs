defmodule ListLengthTest do
  use ExUnit.Case

  describe "call/1" do
    test "returns the list count" do
      list = [1, 2, 3, 5, 7]
      expected = 5
      assert ListLength.call(list) == expected
    end
  end
end
