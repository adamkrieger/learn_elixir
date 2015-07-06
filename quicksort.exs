# Quicksort implementation, but immutable...
# Adam Krieger
# 2015-07-05

defmodule Quicksort do
  def run([]), do: []
  def run(list = [head | _]), do: _run(list, head)

  defp _run([pivot | tail], pivot) do
    left = Enum.filter(tail, &(&1 < pivot))
    right = Enum.filter(tail, &(&1 > pivot))
    match = Enum.filter(tail, &(&1 == pivot))
    List.flatten([run(left), pivot, match, run(right)])
  end
end
