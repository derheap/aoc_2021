
import ExUnit.Assertions

test_input = """
199
200
208
210
200
207
240
269
260
263
"""

defmodule One do

  defp parse(text) do
    text
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(fn it -> String.length(it) > 0 end)
    |> Enum.map(&String.to_integer/1)
  end

  defp count_increment(item, {last,count}) do
    {item, if item > last do count+1 else count end}
  end

  defp calc_window(list) do
    list
    |> Enum.chunk_every(3,1)
    |> Enum.map(&Enum.sum/1)
  end

  def part_one(input) do
    input
    |> parse()
    |> Enum.reduce({0,-1}, &count_increment/2)
    |> elem(1)
  end

  def part_two(input) do
    input
    |> parse()
    |> calc_window()
    |> Enum.reduce({0,-1}, &count_increment/2)
    |> elem(1)
  end


end

assert One.part_one(test_input) == 7
assert One.part_two(test_input) == 5

input = File.read!("input/01.txt")

input
|> One.part_one()
|> IO.inspect()

input
|> One.part_two()
|> IO.inspect()
