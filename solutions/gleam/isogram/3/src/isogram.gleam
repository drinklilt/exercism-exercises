import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.to_graphemes
  // get individual characters
  |> list.filter(fn(ch) { string.uppercase(ch) != string.lowercase(ch) })
  // filter out non-alphabetical characters
  |> list.map(string.lowercase)
  |> fn(c) { c == list.unique(c) }
}
