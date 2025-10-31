defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split([" : ", ",", " ", "_"])
    |> select_words()
    |> count_words()
  end

  defp select_words(sentence),
    do: sentence |> Enum.map(fn word -> Regex.scan(~r/[\w|-]+/u, word) end) |> List.flatten()

  defp count_words(words_list) do
    Enum.reduce(words_list, %{}, fn word, words ->
      count = Map.get(words, word, 0)
      Map.put(words, word, count + 1)
    end)
  end
end
