defmodule SimpleSupervisorTest do
  use ExUnit.Case
  doctest SimpleSupervisor

  test "greets the world" do
    assert SimpleSupervisor.hello() == :world
  end
end
