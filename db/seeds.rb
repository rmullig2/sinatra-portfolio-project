teams_list = {
    "Baltimore Orioles" => {
      :league => "American"
      :divison => "East"
    },
    "Boston Red Sox" => {
      :league => "American"
      :divison => "East"
    },
    "New York Yankees" => {
      :league => "American"
      :divison => "East"
    },
    "Tampa Bay Rays" => {
      :league => "American"
      :divison => "East"
    },
    "Toronto Blue Jays" => {
      :league => "American"
      :divison => "East"
    },
    "Chicago White Sox" => {
      :league => "American"
      :divison => "Central"
    },
    "Cleveland Indians" => {
      :league => "American"
      :divison => "Central"
    },
    "Detroit Tigers" => {
      :league => "American"
      :divison => "Central"
    },
    "Kansas City Royals" => {
      :league => "American"
      :divison => "Central"
    },
    "Minnesota Twins" => {
      :league => "American"
      :divison => "Central"
    },
    "Houston Astros" => {
      :league => "American"
      :divison => "West"
    }
    "Los Angeles Angels" => {
      :league => "American"
      :divison => "West"
    }
    "Oakland A's" => {
      :league => "American"
      :divison => "West"
    }
    "Seattle Mariners" => {
      :league => "American"
      :divison => "West"
    }
    "Texas Rangers" => {
      :league => "American"
      :divison => "West"
    }
    "Atlanta Braves" => {
      :league => "National"
      :divison => "East"
    }
    "Miami Marlins" => {
      :league => "National"
      :divison => "East"
    }
    "New York Mets" => {
      :league => "National"
      :divison => "East"
    }
    "Philadelphia Phillies" => {
      :league => "National"
      :divison => "East"
    }
    "Washington Nationals" => {
      :league => "National"
      :divison => "East"
    }
    "Chicago Cubs" => {
      :league => "National"
      :divison => "Central"
    }
    "Cincinnati Reds" => {
      :league => "National"
      :divison => "Central"
    }
    "Milwaukee Brewers" => {
      :league => "National"
      :divison => "Central"
    }
    "Pittsburgh Pirates" => {
      :league => "National"
      :divison => "Central"
    }
    "St. Louis Cardinals" => {
      :league => "National"
      :divison => "Central"
    }
    "Arizona Diamondbacks" => {
      :league => "National"
      :divison => "West"
    }
    "Colorado Rockies" => {
      :league => "National"
      :divison => "West"
    }
    "Los Angeles Dodgers" => {
      :league => "National"
      :divison => "West"
    }
    "San Diego Padres" => {
      :league => "National"
      :divison => "West"
    }
    "San Franciso Giants" => {
      :league => "National"
      :divison => "West"
    }
  }

teams_list.each do |name, league, division|
  t = Team.new
  t.name = name
  t.league = league
  t.division = division
  t.save
end

user_list = {
    "Admin" => {
    }
  }

user_list.each do |name|
  u = User.new
  u.name = name
  u.save
end