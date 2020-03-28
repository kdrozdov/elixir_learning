defmodule Kata do
  def strong(n) do
    factorial_sum =
      n
      |> digits
      |> Enum.map(&factorial/1)
      |> Enum.sum()

    is_strong = factorial_sum == n

    case is_strong do
      true -> "STRONG!!!!"
      false -> "Not Strong !!"
    end
  end

  def factorial(n), do: factorial(n, 1)
  def factorial(0, acc), do: acc
  def factorial(n, acc), do: factorial(n - 1, acc * n)

  def digits(n), do: digits(n, [])
  def digits(0, acc), do: acc

  def digits(n, acc) do
    digit = rem(n, 10)
    digits(div(n, 10), [digit | acc])
  end
end
