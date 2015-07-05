# Make use of Erlang and Elixir builtin libraries
# 2015-07-04

defmodule UseLibs do
  def run do
    IO.puts :io_lib.format("~.2f", [34.356])
    IO.puts to_string(System.get_env("USER"))
    IO.puts Path.extname("directory/file.txt")
    IO.puts System.cwd()
    # poison on hex
    {out, res} = System.cmd("ls", [])
    IO.puts out
  end
end
