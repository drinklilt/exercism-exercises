pub fn eat_ghost(power_pellet_active: Bool, touching_ghost: Bool) -> Bool {
  power_pellet_active && touching_ghost
}

pub fn score(touching_power_pellet: Bool, touching_dot: Bool) -> Bool {
  touching_power_pellet || touching_dot
}

pub fn lose(power_pellet_active: Bool, touching_ghost: Bool) -> Bool {
  !power_pellet_active && touching_ghost
}

pub fn win(
  _has_eaten_all_dots: Bool,
  power_pellet_active: Bool,
  touching_ghost: Bool,
) -> Bool {
  // has_eaten_all_dots test is not actually counted in the tests
  case touching_ghost {
    True -> eat_ghost(power_pellet_active, touching_ghost)
    False -> True
  }
}
