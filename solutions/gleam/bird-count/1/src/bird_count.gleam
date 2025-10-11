import gleam/erlang/process
import gleam/int
import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [d, ..] -> d
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [d, ..r] -> [d + 1, ..r]
    _ -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  list.any(days, fn(d) { d == 0 })
}

pub fn total(days: List(Int)) -> Int {
  int.sum(days)
}

pub fn busy_days(days: List(Int)) -> Int {
  list.filter(days, fn(d) { d > 4 })
  |> list.length
}
