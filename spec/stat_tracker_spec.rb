require "spec_helper"

RSpec.describe StatTracker do
  before(:all) do
    game_path = './data/games.csv'
    team_path = './data/teams.csv'
    game_teams_path = './data/game_teams.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }
    @stat_tracker = StatTracker.from_csv(locations)
  end

  describe "#initialize" do
    it "exists" do
      expect(@stat_tracker).to be_a(StatTracker)
    end
  end
  
  describe "#highest_total_score" do
    it "#highest_total_score" do
      expect(@stat_tracker.highest_total_score).to eq 11
    end
  end

  describe "#lowest_total_score" do
    it "#returns lowest total scores" do
      expect(@stat_tracker.lowest_total_score).to eq 0
    end
  end

  describe "#percentage_home_wins" do
    it "returns the percentage of home team wins" do
      expect(@stat_tracker.percentage_home_wins).to eq 0.44
    end
  end

  describe "#percentage_visitor_wins" do
    it "returns the percentage of visitor team wins" do
      expect(@stat_tracker.percentage_visitor_wins).to eq 0.36
    end
  end

  describe "#percentage_ties" do
    it "returns the percentage of tied games" do
      expect(@stat_tracker.percentage_ties).to eq 0.20
    end
  end

  describe "#count_of_games_by_season" do
    it "returns a hash with season names as keys and count of games as values" do
      expected = {
        "20122013"=>806,
        "20162017"=>1317,
        "20142015"=>1319,
        "20152016"=>1321,
        "20132014"=>1323,
        "20172018"=>1355
      }
      expect(@stat_tracker.count_of_games_by_season).to eq expected
    end
  end

  describe "#average_goals_per_game" do
    it "returns average number of goals scored in a game across all seasons including both home and away goals" do
      expect(@stat_tracker.average_goals_per_game).to eq(4.22)
    end
  end

  describe "#average_goals_by_season" do
    it "returns average number of goals scored in a game in that season" do
      expected = {
        "20122013"=>4.12,
        "20162017"=>4.23,
        "20142015"=>4.14,
        "20152016"=>4.16,
        "20132014"=>4.19,
        "20172018"=>4.44
      }
      expect(@stat_tracker.average_goals_by_season).to eq expected
    end
  end

  describe "#count_of_teams" do
    it "returns a count of teams" do
      expect(@stat_tracker.count_of_teams).to eq 32
    end
  end

  describe "#best_offense" do
    it "returns the team with the best offense" do
      expect(@stat_tracker.best_offense).to eq "Reign FC"
    end
  end

  describe "#worst_offense" do
    it "returns the team with the worst offense" do
      expect(@stat_tracker.worst_offense).to eq "Utah Royals FC"
    end
  end

  describe "#highest_scoring_visitor" do
    it "returns the highest average scores of visiting teams" do
      expect(@stat_tracker.highest_scoring_visitor).to eq "FC Dallas"
    end
  end

  describe "#highest_scoring_home_team" do
    it "returns the highest average scores of home teams" do
      expect(@stat_tracker.highest_scoring_home_team).to eq "Reign FC"
    end
  end

  describe "#lowest_scoring_visitor" do
    it "#returns the lowest average scores of visiting teams" do
      expect(@stat_tracker.lowest_scoring_visitor).to eq "San Jose Earthquakes"
    end
  end

  describe "#lowest_scoring_home_team" do
    it "#returns the lowest average scores of home teams" do
      expect(@stat_tracker.lowest_scoring_home_team).to eq "Utah Royals FC"
    end
  end

  describe "#winningest_coach" do
    it "returns the coach with best win percentage for the season" do
      expect(@stat_tracker.winningest_coach("20132014")).to eq "Claude Julien"
    end
  end

  describe "#worst_coach" do
    it "returns coach with worse win percentage for season" do
      expect(@stat_tracker.worst_coach("20132014")).to eq "Peter Laviolette"
    end
  end

  describe "#most_accurate_team" do
    it "returns the team with the best ratio of shots to goals for a season" do
      expect(@stat_tracker.most_accurate_team("20132014")).to eq "Real Salt Lake"
    end
  end

  describe "#least_accurate_team" do
    it "returns the team with the worst ratio of shots to goals for a season" do
      expect(@stat_tracker.least_accurate_team("20132014")).to eq "New York City FC"
    end
  end

  describe "#most_tackles" do
    it "returns name of the team with the most tackles in the season" do
      expect(@stat_tracker.most_tackles("20132014")).to eq "FC Cincinnati"
    end
  end

  describe "#fewest_tackles" do
    it "returns name of the team with the least tackles in the season" do
      expect(@stat_tracker.fewest_tackles("20132014")).to eq "Atlanta United"
    end
  end
end 