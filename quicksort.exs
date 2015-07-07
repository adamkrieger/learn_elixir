# Quicksort implementation, but immutable...
# Adam Krieger
# 2015-07-05

defmodule Quicksort do
  def run([]), do: []
  def run(list = [head | _]), do: _run(list, head)

  defp _run([pivot | tail], pivot) do
    {lt, eq, gt} = _sort(tail, pivot)
    List.flatten([run(lt), pivot, eq, run(gt)])
  end

  defp _sort([], _) do
    {[],[],[]}
  end
  defp _sort(list, pivot) do
    _sort({[],[],[]}, list, pivot)
  end

  defp _sort({lt, eq, gt}, [], _) do
    IO.puts "break"
    {List.flatten(lt), eq, List.flatten(gt)}
  end
  defp _sort({lt, eq, gt}, [pivot | tail], pivot) do
    IO.puts "eq"
    _sort({lt, [eq] ++ [pivot], gt}, tail, pivot)
  end
  defp _sort({lt, eq, gt}, [head | tail], pivot) when head < pivot do
    IO.puts "lt"
    _sort({[lt] ++ [head], eq, gt}, tail, pivot)
  end
  defp _sort({lt, eq, gt}, [head | tail], pivot) when head > pivot do
    IO.puts "gt"
    _sort({lt, eq, [gt] ++ [head]}, tail, pivot)
  end
end
