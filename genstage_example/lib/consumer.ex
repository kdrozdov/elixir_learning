defmodule GenstageExample.Consumer do
  use GenStage

  def start_link() do
    GenStage.start_link(__MODULE__, :empty)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [GenstageExample.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect({self(), event, state})
    end

    # Так как мы потребители, мы не создаем события
    {:noreply, [], state}
  end

end
