defmodule Filtron do
  def divisible_by(numbers, divisor) do
    filter(numbers, fn item -> rem(item, divisor) == 0 end)
  end

  def filter(list, f), do: filter(list, f, [])
  def filter([], f, acc), do: :lists.reverse(acc)

  def filter([head | tail], f, acc) do
    if f.(head) do
      filter(tail, f, [head | acc])
    else
      filter(tail, f, acc)
    end
  end
end
