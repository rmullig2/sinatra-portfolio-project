teams_list = [
    { :name => "Baltimore Orioles",
      :league => "American",
      :division => "East"
    },
    { :name => "Boston Red Sox",
      :league => "American",
      :division => "East"
    },
    { :name => "New York Yankees",
      :league => "American",
      :division => "East"
    },
    { :name => "Tampa Bay Rays",
      :league => "American",
      :division => "East"
    },
    { :name => "Toronto Blue Jays",
      :league => "American",
      :division => "East"
    },
    { :name => "Chicago White Sox",
      :league => "American",
      :division => "Central"
    },
    { :name => "Cleveland Indians",
      :league => "American",
      :division => "Central"
    },
    { :name => "Detroit Tigers",
      :league => "American",
      :division => "Central"
    },
    { :name => "Kansas City Royals",
      :league => "American",
      :division => "Central"
    },
    { :name => "Minnesota Twins",
      :league => "American",
      :division => "Central"
    },
    { :name => "Houston Astros",
      :league => "American",
      :division => "West"
    },
    { :name => "Los Angeles Angels",
      :league => "American",
      :division => "West"
    },
    { :name => "Oakland A's",
      :league => "American",
      :division => "West"
    },
    { :name => "Seattle Mariners",
      :league => "American",
      :division => "West"
    },
    { :name => "Texas Rangers",
      :league => "American",
      :division => "West"
    },
    { :name => "Atlanta Braves",
      :league => "National",
      :division => "East"
    },
    { :name => "Miami Marlins",
      :league => "National",
      :division => "East"
    },
    { :name => "New York Mets",
      :league => "National",
      :division => "East"
    },
    { :name => "Philadelphia Phillies",
      :league => "National",
      :division => "East"
    },
    { :name => "Washington Nationals",
      :league => "National",
      :division => "East"
    },
    { :name => "Chicago Cubs",
      :league => "National",
      :division => "Central"
    },
    { :name => "Cincinnati Reds",
      :league => "National",
      :division => "Central"
    },
    { :name => "Milwaukee Brewers",
      :league => "National",
      :division => "Central"
    },
    { :name => "Pittsburgh Pirates",
      :league => "National",
      :division => "Central"
    },
    { :name => "St. Louis Cardinals",
      :league => "National",
      :division => "Central"
    },
    { :name => "Arizona Diamondbacks",
      :league => "National",
      :division => "West"
    },
    { :name => "Colorado Rockies",
      :league => "National",
      :division => "West"
    },
    { :name => "Los Angeles Dodgers",
      :league => "National",
      :division => "West"
    },
    { :name => "San Diego Padres",
      :league => "National",
      :division => "West"
    },
    { :name => "San Franciso Giants",
      :league => "National",
      :division => "West"
    }
  ]

teams_list.each do |team|
  t = Team.new(team)
  t.save
end

user = { :first_name => "Super", :last_name => "User", :user_name => "Admin",
         :password => "pasword123" }
  u = User.new(user)
  u.save
end

players_list = {
    { :name => "Yoenis Cespedes",
      :rank => 1
    },
    { :name => "Edwin Encarncaion",
      :rank => 2
    },
    { :name => "Aroldis Chapman",
      :rank => 3
    },
    { :name => "Justin Turner",
      :rank => 4
    },
    { :name => "Kenley Jansen",
      :rank => 5
    },
    { :name => "Dexter Fowler",
      :rank => 6
    },
    { :name => "Jeremy Hellickson",
      :rank => 7
    },
    { :name => "Mark Trumbo",
      :rank => 8
    },
    { :name => "Ian Desmond",
      :rank => 9
    },
    { :name => "Ivan Nova",
      :rank => 10
    },
    { :name => "Mark Melancon",
      :rank => 11
    },
    { :name => "Jose Bautista",
      :rank => 12
    },
    { :name => "Wilson Ramos",
      :rank => 13
    },
    { :name => "Rich Hill",
      :rank => 14
    },
    { :name => "Jason Hammel",
      :rank => 15
    },
    { :name => "Matt Wieters",
      :rank => 16
    },
    { :name => "Josh Reddick",
      :rank => 17
    },
    { :name => "Neil Walker",
      :rank => 18
    },
    { :name => "Carlos Gomez",
      :rank => 19
    },
    { :name => "Michael Saunders",
      :rank => 20
    },
    { :name => "Mike Napoli",
      :rank => 21
    },
    { :name => "Kendrys Morales",
      :rank => 22
    },
    { :name => "Greg Holland",
      :rank => 23
    },
    { :name => "Travis Wood",
      :rank => 24
    },
    { :name => "Neftali Feliz",
      :rank => 25
    },
    { :name => "Brett Cecil",
      :rank => 26
    },
    { :name => "Brad Ziegler",
      :rank => 27
    },
    { :name => "Andrew Cashner",
      :rank => 28
    },
    { :name => "Jason Castro",
      :rank => 29
    },
    { :name => "Brandon Moss",
      :rank => 30
    },
    { :name => "Luis Valbuena",
      :rank => 31
    },
    { :name => "Joe Blanton",
      :rank => 32
    },
    { :name => "Carlos Beltran",
      :rank => 33
    },
    { :name => "Sergio Romo",
      :rank => 34
    },
    { :name => "Sean Rodriguez",
      :rank => 35
    },
    { :name => "Santiago Casilla",
      :rank => 36
    },
    { :name => "Jon Jay",
      :rank => 37
    },
    { :name => "Fernando Salas",
      :rank => 38
    },
    { :name => "Boone Logan",
      :rank => 39
    },
    { :name => "Matt Holliday",
      :rank => 40
    },
    { :name => "Bartolo Colon",
      :rank => 41
    },
    { :name => "Steve Pearce",
      :rank => 42
    },
    { :name => "Matt Joyce",
      :rank => 43
    },
    { :name => "Nick Hundley",
      :rank => 44
    },
    { :name => "Eric Thames",
      :rank => 45
    },
    { :name => "Charlie Morton",
      :rank => 46
    },
    { :name => "Edinson Volquez",
      :rank => 47
    },
    { :name => "R.A. Dickey",
      :rank => 48
    },
    { :name => "Chase Utley",
      :rank => 49
    },
    { :name => "Derek Holland",
      :rank => 50
    }
}

players_list.each do |player|
  p = Player.new(player)
  p.save
end