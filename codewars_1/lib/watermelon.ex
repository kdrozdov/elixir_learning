defmodule Watermelon do
  def divide(weight) do
    is_even = rem(weight, 2) == 0

    cond do
      weight <= 2 -> false
      !is_even -> false
      is_even -> true
    end
  end
end
