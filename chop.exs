# 2015-01-04
# Adam Krieger
# Example from chapter 6 of Programming Elixir
# Chop

defmodule Chop do

  def guess(answer, lower..upper) do
    _guess(answer, _mid(lower..upper), lower..upper)
  end

  defp _guess(answer, guess, _lower.._upper) when guess == answer do
    IO.puts "It is #{to_string(guess)}!!!"
  end

  defp _guess(answer, guess, _lower..upper) when guess < answer do
    IO.puts "Greater than #{to_string(guess)}"
    new_guess = _mid(guess..upper)
    _guess(answer, new_guess, guess..upper)
  end

  defp _guess(answer, guess, lower.._upper) when guess > answer do
    IO.puts "Less than #{to_string(guess)}"
    new_guess = _mid(lower..guess)
    _guess(answer, new_guess, lower..guess)
  end

  defp _mid(lower..upper) do
    lower + div((upper-lower), 2)
  end
end
