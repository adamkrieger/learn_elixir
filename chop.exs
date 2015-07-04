# 2015-01-04
# Adam Krieger
# Example from chapter 6 of Programming Elixir
# Chop

defmodule Chop do

  def guess(answer, lower..upper) do
    guess(answer, mid(lower..upper), lower..upper)
  end

  def guess(answer, guess, _lower.._upper) when guess == answer do
    IO.puts "It is #{to_string(guess)}!!!"
  end

  def guess(answer, guess, _lower..upper) when guess < answer do
    IO.puts "Greater than #{to_string(guess)}"
    new_guess = mid(guess..upper)
    guess(answer, new_guess, guess..upper)
  end

  def guess(answer, guess, lower.._upper) when guess > answer do
    IO.puts "Less than #{to_string(guess)}"
    new_guess = mid(lower..guess)
    guess(answer, new_guess, lower..guess)
  end

  defp mid(lower..upper) do
    lower + div((upper-lower), 2)
  end
end
