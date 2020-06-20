defmodule Test do
  def start(number) do
    :timer.sleep(Enum.random(0..5) * 1000)
    IO.puts("Hello from #{number}")
    if rem(number, 2) == 0 do
      number / 0
      start(number)
    else
      start(number)
    end
  end
end
