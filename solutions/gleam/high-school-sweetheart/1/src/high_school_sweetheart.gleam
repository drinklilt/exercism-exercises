import gleam/list
import gleam/result
import gleam/string

pub fn first_letter(name: String) {
  string.trim(name)
  |> string.slice(0, 1)
}

pub fn initial(name: String) {
  name |> first_letter |> string.uppercase <> "."
}

pub fn initials(full_name: String) {
  case string.split(full_name, " ") {
    [f, s] -> initial(f) <> " " <> initial(s)
    _ -> ""
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
