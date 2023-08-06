require_relative 'game_statistics.rb'
require_relative 'league_statistics.rb'
require_relative 'season_statistics.rb'
require 'csv'

class StatTracker
  attr_reader :game_statistics,
              :season_statistics, 
              :league_statistics
  def initialize(locations)
    @locations = locations
    @game_data = CSV.read locations[:games], headers: true, header_converters: :symbol
    @teams_data = CSV.read locations[:teams], headers: true, header_converters: :symbol
    @game_team_data = CSV.read locations[:game_teams], headers: true, header_converters: :symbol  
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def highest_total_score
    @game_statistics.highest_total_score
  end

  def lowest_total_score
    @game_statistics.lowest_total_score
  end

  def percentage_home_wins
    @game_statistics.percentage_home_wins
  end

  def percentage_visitor_wins
    @game_statistics.percentage_visitor_wins
  end

  def percentage_ties
    @game_statistics.percentage_ties
  end
end 