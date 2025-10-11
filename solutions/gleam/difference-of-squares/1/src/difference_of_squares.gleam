pub fn square_of_sum(n: Int) -> Int {
  sum(n) * sum(n)
}

fn sum(n: Int) -> Int {
  case n {
    0 -> 0
    _ -> n + sum(n - 1)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    0 -> 0
    _ -> sum_of_squares(n - 1) + n * n
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
