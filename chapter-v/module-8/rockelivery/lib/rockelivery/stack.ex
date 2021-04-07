defmodule Rockelivery.Stack do
  use GenServer

  # Client

  def start_link(initial_stack) when is_list(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack)
  end

  def pop(pid), do: GenServer.call(pid, :pop)

  def push(pid, element), do: GenServer.call(pid, {:push, element})

  def apush(pid, element), do: GenServer.cast(pid, {:push, element})

  # Server (Callbacks)

  @impl true
  def init(stack), do: {:ok, stack}

  @impl true
  def handle_call(:pop, _from, []), do: {:reply, nil, []}

  @impl true
  def handle_call(:pop, _from, [head | tail]), do: {:reply, head, tail}

  @impl true
  def handle_call({:push, element}, _from, stack) do
    new_stack = [element | stack]
    {:reply, new_stack, new_stack}
  end

  @impl true
  def handle_cast({:push, element}, stack), do: {:noreply, [element | stack]}
end
