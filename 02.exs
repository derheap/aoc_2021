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
    |> Enum.filter(&(String.length(&1) > 0))
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&{Enum.at(&1, 0), String.to_integer(Enum.at(&1, 1))})
  end

  defp dive({move, change}, {pos, depth}) do
    case {move, change} do
      {"forward", change} -> {pos + change, depth}
      {"up", change} -> {pos, depth - change}
      {"down", change} -> {pos, depth + change}
      _ -> {pos, depth}
    end
  end

  defp dive_aim({move, change}, {pos, depth, aim}) do
    case {move, change} do
      {"forward", change} -> {pos + change, depth + aim * change, aim}
      {"up", change} -> {pos, depth, aim - change}
      {"down", change} -> {pos, depth, aim + change}
      _ -> {pos, depth}
    end
  end

  def part_one(input) do
    input
    |> parse()
    |> Enum.reduce({0, 0}, &dive/2)
    |> then(fn {pos, depth} -> pos * depth end)
  end

  def part_two(input) do
    input
    |> parse()
    |> Enum.reduce({0, 0, 0}, &dive_aim/2)
    |> then(fn {pos, depth, _} -> pos * depth end)
  end
end

test_input
|> One.part_one()
|> IO.inspect()

test_input
|> One.part_two()
|> IO.inspect()

assert One.part_one(test_input) == 150
assert One.part_two(test_input) == 900

input = File.read!("input/02.txt")

input
|> One.part_one()
|> IO.inspect()

input
|> One.part_two()
|> IO.inspect()
