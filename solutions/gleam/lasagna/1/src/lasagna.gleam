pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(actual_minutes: Int) -> Int {
  40 - actual_minutes
}

pub fn preparation_time_in_minutes(layers: Int) -> Int {
  layers * 2
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(layers: Int, time_in_oven: Int) -> Int {
  preparation_time_in_minutes(layers) + time_in_oven
}

pub fn alarm() {
  "Ding!"
}
