import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, fn(c) {
    case c |> string.lowercase == word |> string.lowercase {
      True -> False
      False -> {
        c
        |> string.lowercase
        |> string.to_graphemes
        |> list.sort(string.compare)
        |> string.join("")
        == word
        |> string.lowercase
        |> string.to_graphemes
        |> list.sort(string.compare)
        |> string.join("")
      }
    }
  })
}
