defmodule Kata do
  def no_space(x) do
    x
    |> String.graphemes()
    |> replace(" ", "")
    |> to_string
  end

  def replace(list, item, replacement), do: replace(list, item, replacement, [])
  def replace([], _item, _replacement, acc), do: :lists.reverse(acc)

  def replace([head | tail], item, replacement, acc) do
    if head == item do
      new_acc = append_unless_empty(acc, replacement)
      replace(tail, item, replacement, new_acc)
    else
      replace(tail, item, replacement, [head | acc])
    end
  end

  def append_unless_empty(list, ""), do: list
  def append_unless_empty(list, item), do: [item | list]
end
