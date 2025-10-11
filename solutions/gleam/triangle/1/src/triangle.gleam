import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  case
    { result.unwrap(list.max([a, b, c], float.compare), 0.0) }
    <. { a +. b +. c -. result.unwrap(list.max([a, b, c], float.compare), 0.0) }
  {
    True -> a == b && b == c && c == a
    False -> False
  }
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  case
    { result.unwrap(list.max([a, b, c], float.compare), 0.0) }
    <. { a +. b +. c -. result.unwrap(list.max([a, b, c], float.compare), 0.0) }
  {
    True -> list.length(list.unique([a, b, c])) < 3
    False -> False
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  case
    { result.unwrap(list.max([a, b, c], float.compare), 0.0) }
    <. { a +. b +. c -. result.unwrap(list.max([a, b, c], float.compare), 0.0) }
  {
    True -> a != b && b != c && c != a
    False -> False
  }
}
