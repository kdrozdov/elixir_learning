defmodule Codewars1Test do
  use ExUnit.Case
  doctest Codewars1

  test "greets the world" do
    assert Codewars1.hello() == :world
  end
end
