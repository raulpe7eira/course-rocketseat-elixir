defmodule QueueTest do
  use ExUnit.Case
  doctest Queue

  test "greets the world" do
    assert Queue.hello() == :world
  end
end
