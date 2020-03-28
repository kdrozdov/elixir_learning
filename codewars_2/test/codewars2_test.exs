defmodule Codewars2Test do
  use ExUnit.Case
  doctest Codewars2

  test "greets the world" do
    assert Codewars2.hello() == :world
  end
end
