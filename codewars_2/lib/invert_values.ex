defmodule Inverter do
  def invert(list) do
    map(list, &(&1 * -1))
  end

  def map(list, f), do: map(list, f, [])
  def map([], _f, acc), do: :lists.reverse(acc)

  def map([head | tail], f, acc) do
    item = f.(head)
    map(tail, f, [item | acc])
  end
end
