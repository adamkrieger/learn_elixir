# Find max value in list
# Adam Krieger
# 2015-07-06

defmodule Max do
  def find([head | tail]), do: _getmax(tail, head)

  defp _getmax([], max), do: max
  defp _getmax([max | tail], max), do: _getmax(tail, max)
  defp _getmax([head | tail], max) when head > max, do: _getmax(tail, head)
  defp _getmax([head | tail], max) when head < max, do: _getmax(tail, max)

end
