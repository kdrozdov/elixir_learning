defmodule SimpleScrapperTest do
  use ExUnit.Case
  doctest SimpleScrapper

  test "greets the world" do
    assert SimpleScrapper.hello() == :world
  end
end
