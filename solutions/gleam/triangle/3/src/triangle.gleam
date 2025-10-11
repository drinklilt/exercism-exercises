import gleam/float
import gleam/list

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    True -> a == b && b == c && c == a
    False -> False
  }
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    True -> list.length(list.unique([a, b, c])) < 3
    False -> False
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    True -> a != b && b != c && c != a
    False -> False
  }
}

pub fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  // https://en.wikipedia.org/wiki/Triangle_inequality#Mathematical_expression_of_the_constraint_on_the_sides_of_a_triangle
  let assert Ok(max) = list.max([a, b, c], float.compare)
  2.0 *. max <. a +. b +. c
}
