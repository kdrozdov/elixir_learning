defmodule SimpleSupervisor do
  def start(name, child_spec_list) do
    pid = spawn(__MODULE__, :init, [child_spec_list])
    Process.register(pid, name)
    {:ok, pid}
  end

  def stop(name) do
    send(name, :stop)
  end

  def init(child_spec_list) do
    Process.flag(:trap_exit, true)
    child_spec_list
    |> Enum.map(fn {module, fun, args} = child_spec ->
      pid = spawn_link(module, fun, args)
      {pid, child_spec}
    end)
    |> loop()
  end

  def loop(child_list) do
    receive do
      {:EXIT, from, :normal} ->
        IO.puts "The process #{inspect from} will be removed from the list"
        loop(List.keydelete(child_list, from, 0))
      {:EXIT, from, reason} ->
        IO.puts "The proccess #{inspect from} stopped with the following error: #{inspect reason}"
        IO.puts "Trying to restart the proccess"
        {_, {module, fun, args}} = List.keyfind(child_list, from, 0)
        # spawn_link(module, fun, [3])
        spawn_link(module, fun, args)
      :stop ->
        terminate(child_list)
    end
  end

  def terminate(child_list) do
    child_list
    |> Enum.each(fn {pid, _} -> Process.exit(pid, :kill) end)
  end
end
