import gleam/int
import gleam/list
import gleam/result
import gleam/yielder

pub type Character {
  Character(
    charisma: Int,
    constitution: Int,
    dexterity: Int,
    hitpoints: Int,
    intelligence: Int,
    strength: Int,
    wisdom: Int,
  )
}

pub fn generate_character() -> Character {
  let con = ability()
  Character(
    ability(),
    con,
    ability(),
    10 + modifier(con),
    ability(),
    ability(),
    ability(),
  )
}

pub fn modifier(score: Int) -> Int {
  result.unwrap(int.floor_divide({ score - 10 }, 2), 0)
}

pub fn ability() -> Int {
  yielder.repeatedly(fn() { int.random(5) + 1 })
  |> yielder.take(4)
  |> yielder.to_list()
  |> list.sort(int.compare)
  |> list.drop(1)
  |> int.sum
}
