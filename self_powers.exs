# Problem 48 on Project Euler
# Adam Krieger
# 2015-07-04

defmodule SelfPowers do
  def solve(lower..upper) when lower >= upper do
    lower |> _self_power
  end

  def solve(lower..upper) do
    _self_power(lower) + solve((lower+1)..upper)
  end

  defp _self_power(x), do: _exp(x, x)

  defp _exp(_, 0), do: 1
  defp _exp(x, y), do: x * _exp(x, y-1)
end
