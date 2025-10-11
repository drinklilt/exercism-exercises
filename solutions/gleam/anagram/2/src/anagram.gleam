import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(c) { string.lowercase(word) != string.lowercase(c) })
  |> list.filter(fn(c) { to_sorted_letters(word) == to_sorted_letters(c) })
}

pub fn to_sorted_letters(word: String) -> List(String) {
  word
  |> string.lowercase()
  |> string.to_graphemes()
  |> list.sort(string.compare)
}
