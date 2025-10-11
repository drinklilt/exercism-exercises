import gleam/int
import gleam/list
import gleam/result

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.map(factors, fn(f) {
    list.range(0, result.unwrap(int.floor_divide(limit - 1, f), 1))
    |> list.map(fn(i) { i * f })
  })
  |> list.flatten
  |> list.unique
  |> int.sum
}
