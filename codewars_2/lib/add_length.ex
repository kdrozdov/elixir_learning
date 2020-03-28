defmodule Marker do
  def add_length(str) do
    str
    |> String.graphemes()
    |> split(" ")
    |> map(fn item -> List.to_string(item) <> " #{length(item)}" end)
  end

  def split(graphemes, delimiter), do: split(graphemes, delimiter, [], [])

  def split([], _delimiter, word, result) do
    :lists.reverse(add_word(result, word))
  end

  def split([head | tail], delimiter, word, result) do
    if head == delimiter do
      split(tail, delimiter, [], add_word(result, word))
    else
      split(tail, delimiter, [head | word], result)
    end
  end

  def add_word(list, word) do
    word = :lists.reverse(word)
    [word | list]
  end

  def map(list, f), do: map(list, f, [])
  def map([], _f, acc), do: :lists.reverse(acc)

  def map([head | tail], f, acc) do
    item = f.(head)
    map(tail, f, [item | acc])
  end
end
