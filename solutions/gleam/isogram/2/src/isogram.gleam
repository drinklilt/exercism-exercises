import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letters =
    list.filter(phrase |> string.lowercase |> string.to_graphemes, fn(ch) {
      string.uppercase(ch) != string.lowercase(ch)
    })
  case list.length(letters) == list.length(list.unique(letters)) {
    True -> True
    False -> False
  }
}
