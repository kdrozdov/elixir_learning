defmodule Whicharein do
  def in_array(array1, array2) do
    array1
    |> Enum.filter(fn item -> contains_substring?(array2, item) end)
    |> Enum.sort()
  end

  def contains_substring?(list, substring) do
    Enum.any?(list, fn item -> substring?(substring, item) end)
  end

  def substring?(substring, string) do
    string =~ substring
  end
end
