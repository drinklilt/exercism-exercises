pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

// TODO: please define the 'Activity' custom type

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill -> No
    Movie(g) -> {
      case g {
        Romance -> Yes
        _ -> No
      }
    }
    Restaurant(c) ->
      case c {
        Korean -> Yes
        Turkish -> Maybe
      }
    Walk(i) ->
      case i > 11, i > 6 {
        True, _ -> Yes
        False, True -> Maybe
        _, _ -> No
      }
  }
}
