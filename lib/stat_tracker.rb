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