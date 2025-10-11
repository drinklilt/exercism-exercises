import gleam/list
import gleam/result
import gleam/string

pub fn message(log_line: String) -> String {
  string.split(log_line, ":")
  |> list.drop(1)
  |> list.map(string.trim)
  |> string.join("")
}

pub fn log_level(log_line: String) -> String {
  string.split(log_line, ":")
  |> list.first
  |> result.unwrap("")
  |> string.trim
  |> string.drop_start(1)
  |> string.drop_end(1)
  |> string.lowercase
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
