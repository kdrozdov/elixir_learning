defmodule Stack do
  use GenServer

  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :stack)
  end

  def push(item) do
    GenServer.call(:stack, {:push, item})
  end

  def pop do
    GenServer.call(:stack, :pop)
  end

  def peek do
    GenServer.call(:stack, :peek)
  end

  # Server

  def init(list) do
    {:ok, list}
  end

  def handle_call({:push, item}, _from, list) do
    new_list = [item|list]
    {:reply, new_list, new_list}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop, _from, [head|tail]) do
    {:reply, head, tail}
  end

  def handle_call(:peek, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:peek, _from, [head|tail] = list) do
    {:reply, head, list}
  end
end
