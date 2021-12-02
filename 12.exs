defmodule Twelve do
  def part_one(input) do
    input
    |> parse()
  end

  def part_two(input) do
    input
    |> parse()
  end

  defp parse(text) do
    text
    # |> String.split("\n")
    # |> Enum.map(&String.to_integer/1)
  end
end

input = File.read!("input/12.txt")

input
|> Twelve.part_one()
|> IO.inspect()

# input
# |> Twelve.part_two()
# |> IO.inspect()
