defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split([" : ", ",", " ", "_"])
    |> Enum.map(fn word -> Regex.scan(~r/[\w|-]+/u, word) end)
    |> List.flatten()
    |> Enum.reduce(%{}, fn word, words ->
      key = String.downcase(word)
      count = Map.get(words, key, 0)
      Map.put(words, key, count + 1)
    end)
  end
end
