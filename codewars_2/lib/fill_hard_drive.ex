defmodule FillTheDrive do
  def save(sizes, hd) do
    count_files(sizes, hd)
  end

  def count_files(sizes, hd), do: count_files(sizes, hd, 0)
  def count_files(sizes, hd, acc) when hd <= 0, do: acc
  def count_files([], hd, acc), do: acc

  def count_files([head | tail], hd, acc) do
    remained_hd = hd - head

    if remained_hd >= 0 do
      count_files(tail, remained_hd, acc + 1)
    else
      count_files(tail, remained_hd, acc)
    end
  end
end
