require_relative 'game_statistics.rb'
require_relative 'league_statistics.rb'
require_relative 'season_statistics.rb'

class StatTracker
  attr_reader :game_statistics, :season_statistics, :league_statistics
  def initialize(games_data, teams_data, game_teams_data)
    @games = games_data
    @teams = teams_data
    @game_teams = game_teams_data
  end

  def self.from_csv(locations)
    games_data = CSV.read(locations[:games], headers: true, header_converters: :symbol) 
    teams_data = CSV.read(locations[:teams], headers: true, header_converters: :symbol) 
    game_teams_data = CSV.read(locations[:game_teams], headers: true, header_converters: :symbol) 
    new(games_data, teams_data, game_teams_data)
  end

  def highest_total_score
    GameStatistics.new.highest_total_score(@games)
  end

  def lowest_total_score
    GameStatistics.new.lowest_total_score(@games)
  end

  def percentage_home_wins
    GameStatistics.new.percentage_home_wins(@games)
  end

  def percentage_visitor_wins
    GameStatistics.new.percentage_visitor_wins(@games)
  end

  def percentage_ties
    GameStatistics.new.percentage_ties(@games)
  end
end