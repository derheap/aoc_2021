import ExUnit.Assertions

comment = """
--- Day 3: Binary Diagnostic ---

The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case.

The diagnostic report (your puzzle input) consists of a list of binary numbers which, when decoded properly, can tell you many useful things about the conditions of the submarine. The first parameter to check is the power consumption.

You need to use the binary numbers in the diagnostic report to generate two new binary numbers (called the gamma rate and the epsilon rate). The power consumption can then be found by multiplying the gamma rate by the epsilon rate.

Each bit in the gamma rate can be determined by finding the most common bit in the corresponding position of all numbers in the diagnostic report. For example, given the following diagnostic report:

00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010

Considering only the first bit of each number, there are five 0 bits and seven 1 bits. Since the most common bit is 1, the first bit of the gamma rate is 1.

The most common second bit of the numbers in the diagnostic report is 0, so the second bit of the gamma rate is 0.

The most common value of the third, fourth, and fifth bits are 1, 1, and 0, respectively, and so the final three bits of the gamma rate are 110.

So, the gamma rate is the binary number 10110, or 22 in decimal.

The epsilon rate is calculated in a similar way; rather than use the most common bit, the least common bit from each position is used. So, the epsilon rate is 01001, or 9 in decimal. Multiplying the gamma rate (22) by the epsilon rate (9) produces the power consumption, 198.

Use the binary numbers in your diagnostic report to calculate the gamma rate and epsilon rate, then multiply them together. What is the power consumption of the submarine? (Be sure to represent your answer in decimal, not binary.)

"""

test_input = """
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
"""

defmodule One do
  defp splitToInt(s) do
    Enum.map(String.split(s, "", trim: true), &String.to_integer/1)
  end

  defp bitsToInt(bits) do
    Enum.reduce(bits, 0, fn el, acc -> acc * 2 + el end)
  end

  defp negate(bits) do
    Enum.map(bits, fn
      1 -> 0
      0 -> 1
    end)
  end

  defp parse(text) do
    text
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&(String.length(&1) > 0))
    |> Enum.map(&splitToInt/1)
  end

  def part_one(input) do
    text = parse(input)
    half = Enum.count(text) / 2

    text
    |> Enum.zip_with(&Enum.sum(&1))
    |> Enum.map(fn x ->
      if x > half do
        1
      else
        0
      end
    end)
    |> then(fn b -> bitsToInt(negate(b)) * bitsToInt(b) end)
  end

  defp prefer_most_common(count, max_count) do
    half = max_count / 2

    case count do
      count when count < half -> 0
      _ -> 1
    end
  end

  defp filter(bits, binaries, pos) do
    bit = Enum.at(bits, pos)
    Enum.filter(binaries, &nil)
  end

  def part_two(input) do
    binary = parse(input)

    binary
    |> Enum.zip_with(&Enum.sum(&1))
    |> Enum.map(&prefer_most_common(&1, Enum.count(binary)))
    |> filter(binary, 0)
  end
end

test_input
|> One.part_one()
|> IO.inspect()

test_input
|> One.part_two()
|> IO.inspect()

# assert One.part_one(test_input) == 150
# assert One.part_two(test_input) == 900

input = File.read!("input/03.txt")

input
|> One.part_one()
|> IO.inspect()

# input
# |> One.part_two()
# |> IO.inspect()
