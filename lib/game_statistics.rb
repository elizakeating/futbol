require 'csv'
class GameStatistics
  def initialize
  end

  def percentage_calculator(portion, whole)
    percentage_return = (portion / whole).round(2)
  end

  def highest_total_score(location)
    highest_total_score = 0
    location.each do |row|
    total_score = row[:away_goals].to_i + row[:home_goals].to_i #away_goals + home_goals
    highest_total_score = total_score if total_score > highest_total_score
    end
    highest_total_score
  end

  def lowest_total_score(location)
    lowest_total_score = nil
    location.each do |row|
    total_score = row[:away_goals].to_i + row[:home_goals].to_i #away_goals + home_goals
      lowest_total_score = total_score if lowest_total_score == nil || total_score < lowest_total_score
    end
    lowest_total_score
  end
  
  def percentage_home_wins(location)
    total_games = 0
    home_team_wins = 0
    location.each do |row|
      total_games += 1.0
      home_team_wins += 1.0 if row[:home_goals].to_f > row[:away_goals].to_f
    end
    percentage_calculator(home_team_wins, total_games)
  end

  def percentage_visitor_wins(location)
    total_games = 0
    visitor_team_wins = 0
    location.each do |row|
      total_games += 1.00
      visitor_team_wins += 1.00 if row[:away_goals].to_f > row[:home_goals].to_f
    end
    percentage_calculator(visitor_team_wins, total_games)
  end

  def percentage_ties(location)
    total_games = 0
    tied_games = 0
    location.each do |row|
      total_games += 1.00
      tied_games += 1.00 if row[:away_goals].to_f == row[:home_goals].to_f
    end
    percentage_calculator(tied_games, total_games)
  end  
end