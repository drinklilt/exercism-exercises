pub fn reply(guess: Int) -> String {
  case guess {
    41 -> "So close"
    42 -> "Correct"
    43 -> "So close"
    _ -> {
      case guess < 41 {
        True -> "Too low"
        False -> "Too high"
      }
    }
  }
}
