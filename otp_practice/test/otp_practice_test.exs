defmodule OtpPracticeTest do
  use ExUnit.Case
  doctest OtpPractice

  test "greets the world" do
    assert OtpPractice.hello() == :world
  end
end
