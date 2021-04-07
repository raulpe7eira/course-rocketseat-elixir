defmodule QueueTest do
  use ExUnit.Case

  describe "dequeue/1" do
    test "when pid are valid, returns first element" do
      {:ok, pid} = Queue.start_link([1, 2, 3])

      assert Queue.dequeue(pid) == 1
      assert Queue.dequeue(pid) == 2
      assert Queue.dequeue(pid) == 3
      assert Queue.dequeue(pid) == nil
    end
  end

  describe "enqueue/2" do
    test "when all params are valid, returns the element" do
      {:ok, pid} = Queue.start_link([1, 2, 3])

      assert Queue.enqueue(pid, 5) == :ok
    end
  end

  describe "start_link/1" do
    test "when queue is a valid list, creates the pid" do
      assert {:ok, _pid} = Queue.start_link([1, 2, 3])
    end
  end
end
