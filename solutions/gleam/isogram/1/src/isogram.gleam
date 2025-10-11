import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letters =
    list.filter(string.to_graphemes(phrase), fn(ch) {
      let up = string.uppercase(ch)
      let low = string.lowercase(ch)
      up != low
    })
    |> list.map(string.lowercase)
  case list.length(letters) == list.length(list.unique(letters)) {
    True -> True
    False -> False
  }
}
