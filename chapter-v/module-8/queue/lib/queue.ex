defmodule Queue do
  use GenServer

  # Client

  def start_link(initial_queue) when is_list(initial_queue) do
    GenServer.start_link(__MODULE__, initial_queue)
  end

  def dequeue(pid), do: GenServer.call(pid, :dequeue)

  def enqueue(pid, element), do: GenServer.cast(pid, {:enqueue, element})

  # Server

  @impl true
  def init(queue), do: {:ok, queue}

  @impl true
  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}

  @impl true
  def handle_call(:dequeue, _from, [head | tail]), do: {:reply, head, tail}

  @impl true
  def handle_cast({:enqueue, element}, queue), do: {:noreply, [element | queue]}
end
