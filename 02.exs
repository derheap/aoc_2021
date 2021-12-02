
import ExUnit.Assertions

test_input = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""

defmodule One do

  defp parse(text) do
    text
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(fn it -> String.length(it) > 0 end)
    |> Enum.map(fn it -> String.split(it, " ") end)
    |> Enum.map(fn it -> {Enum.at(it,0), String.to_integer(Enum.at(it,1))} end)
  end

  def part_one(input) do
    input
    |> parse()
  end

  def part_two(input) do
    input
    |> parse()
  end


end

test_input
|> One.part_one()
|> IO.inspect()

#assert One.part_one(test_input) == 7
#assert One.part_two(test_input) == 5

input = File.read!("input/02.txt")

input
|> One.part_one()
|> IO.inspect()

#input
#|> One.part_two()
#|> IO.inspect()
