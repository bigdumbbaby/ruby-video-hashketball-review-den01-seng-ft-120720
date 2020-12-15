require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def players 
  game_hash[:home][:players].concat game_hash[:away][:players]
end

def find_player player_name
  found_player = players.find do |player|
    player[:player_name] == player_name
  end
end

# Write code here
def num_points_scored(players_name)
  find_player(players_name)[:points]
end

def shoe_size(players_name)
  find_player(players_name)[:shoe]
end

def find_team team_name 
  game_hash.values.find do |team|
    team_name == team[:team_name]
  end
end

def team_colors(team_name)
  find_team(team_name)[:colors]
end

def team_names
  names = []
  names[0] = game_hash[:home][:team_name]
  names[1] = game_hash[:away][:team_name]
  names
end

def player_numbers(team_name)
  numbers = []
  index = 0
  game_hash.each do |key, value|
    value[:players].each do |inner_key|
      if value[:team_name] == team_name
        numbers[index] = inner_key[:number]
        index += 1 
      end
    end
  end
  numbers
end


def player_stats(players_name)
  stats = {}
  game_hash.each do |key, value|
    value[:players].each do |inner_key| 
      #binding.pry
      if inner_key[:player_name] == players_name
        stats = inner_key
        #binding.pry
      end
    end 
    #binding.pry
  end
  stats
end

def big_shoe_rebounds
  rebounds = 0 
  largest_shoe_size = 0
  game_hash.each do |key, value|
    value[:players].each do |inner_key| 
      #binding.pry
      if inner_key[:shoe] > largest_shoe_size
        largest_shoe_size = inner_key[:shoe]
        rebounds = inner_key[:rebounds]
        #binding.pry
      end
    end 
    #binding.pry
  end
  rebounds
end