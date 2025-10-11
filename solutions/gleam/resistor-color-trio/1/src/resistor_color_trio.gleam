import gleam/float
import gleam/int
import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  case colors {
    [first, second, exponent, ..] -> {
      let power =
        int.power(10, int.to_float(get_value(exponent)))
        |> result.unwrap(0.0)
        |> float.truncate
      let ohms = { { get_value(first) * 10 } + get_value(second) } * power
      case ohms {
        o if ohms >= 1_000_000_000 ->
          Ok(Resistance("gigaohms", o / 1_000_000_000))
        o if ohms >= 1_000_000 -> Ok(Resistance("megaohms", o / 1_000_000))
        o if ohms >= 1000 -> Ok(Resistance("kiloohms", o / 1000))
        o -> Ok(Resistance("ohms", o))
      }
    }
    _ -> Error(Nil)
  }
}

pub fn get_value(colour: String) -> Int {
  case colour {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> -1
  }
}
