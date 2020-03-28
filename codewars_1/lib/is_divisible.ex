defmodule Kata do
  @spec is_divisible(pos_integer(), pos_integer(), pos_integer()) :: boolean()
  def is_divisible(n, x, y) do
    case {rem(n, x), rem(n, y)} do
      {0, 0} -> true
      _ -> false
    end
  end
end
