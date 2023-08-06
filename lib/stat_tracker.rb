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
    @game_statistics = GameStatistics.new(locations) 
    @league_statistics = LeagueStatistics.new(locations)
    @season_statistics = SeasonStatistics.new(locations)
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

  def count_of_games_by_season
    @game_statistics.count_of_games_by_season
  end

  def average_goals_per_game
    @game_statistics.average_goals_per_game
  end

  def average_goals_by_season
    @game_statistics.average_goals_by_season
  end

  def count_of_teams
    @league_statistics.count_of_teams
  end

  def best_offense
    @league_statistics.best_offense
  end

  def worst_offense
    @league_statistics.worst_offense
  end

  def highest_scoring_visitor
    @league_statistics.highest_scoring_visitor
  end

  def highest_scoring_home_team
    @league_statistics.highest_scoring_home_team
  end

  def lowest_scoring_home_team
    @league_statistics.lowest_scoring_home_team
  end

  def lowest_scoring_visitor
    @league_statistics.lowest_scoring_visitor
  end

  def winningest_coach(season_id)
    @season_statistics.winningest_coach(season_id)
  end

  def worst_coach(season_id)
    @season_statistics.worst_coach(season_id)
  end

  def most_accurate_team(season_id)
    @season_statistics.most_accurate_team(season_id)
  end

  def least_accurate_team(season_id)
    @season_statistics.least_accurate_team(season_id)
  end

  def most_tackles(season_id)
    @season_statistics.most_tackles(season_id)
  end

  def fewest_tackles(season_id)
    @season_statistics.fewest_tackles(season_id)
  end
end 