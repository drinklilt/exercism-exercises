import gleam/list
import gleam/string

pub fn hey(remark: String) -> String {
  case string.reverse(string.trim(remark)) {
    "?" <> rem ->
      case all_letters_uppercase(rem) {
        True -> "Calm down, I know what I'm doing!"
        False -> "Sure."
      }
    "" -> "Fine. Be that way!"
    rem ->
      case all_letters_uppercase(rem) {
        True -> "Whoa, chill out!"
        False -> "Whatever."
      }
  }
}

pub fn all_letters_uppercase(sentence: String) -> Bool {
  let chars = string.to_graphemes(sentence)

  // Filter only letters
  let letters =
    list.filter(chars, fn(ch) {
      let up = string.uppercase(ch)
      let low = string.lowercase(ch)
      up != low
    })

  // Return False if no letters
  case list.is_empty(letters) {
    True -> False
    False ->
      // Check that all letters are uppercase
      list.all(letters, fn(ch) { ch == string.uppercase(ch) })
  }
}
