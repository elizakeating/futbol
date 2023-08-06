require "spec_helper"

RSpec.describe LeagueStatistics do
  before :each do 
    @game_path = './fixture/games_fixture.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './fixture/game_teams_fixture.csv'
    
    @locations = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
    }
    
    @league = LeagueStatistics.new(@locations)
  end
  
  describe "#initialize" do
    it 'exists' do
      expect(@league).to be_a LeagueStatistics
    end
  end

  describe "#locations" do
    it "returns the location attribute" do
      expect(@league.locations).to eq(@locations)
    end
  end

  describe "#game_data" do
    it "returns game_data" do
      expect(@league.game_data).to be_a(CSV::Table)
    end
  end

  describe "#teams_data" do
    it "returns teams_data" do
      expect(@league.teams_data).to be_a(CSV::Table)
    end
  end

  describe "#game_team_data" do
    it "returns game_team_data" do
      expect(@league.game_team_data).to be_a(CSV::Table)
    end
  end

  describe "#count_of_teams" do
    it "can show total number of teams" do 
      expect(@league.count_of_teams).to eq(32)
    end
  end

  describe "#team_name_by_id" do
    it "can show the name of a team based on an id" do 
      expect(@league.team_name_by_id(6)).to eq("FC Dallas")
    end
  end

  describe "#best_offense" do
    it "can show the name of the team with the highest average number of goals scored per game across all seasons " do 
      expect(@league.best_offense).to eq("FC Dallas")
    end
  end

  describe "#worst_offense" do
    it "can show name of the team with the lowest average number of goals scored per game across all seasons." do
      expect(@league.worst_offense).to eq("Sporting Kansas City")
    end 
  end

  describe "#highest_scoring_visitor" do
    it "can show name of the team with the highest average score per game across all seasons when they are away." do
      expect(@league.highest_scoring_visitor).to eq("FC Dallas")
    end 
  end

  describe "#highest_scoring_home_team" do
    it "can show the name of the team with the highest average score per game across all seasons when they are home." do
      expect(@league.highest_scoring_home_team).to eq("FC Dallas")
    end  
  end
  
  describe "#lowest_scoring_visitor" do
    it "can name of the team with the lowest average score per game across all seasons when they are a visitor." do
      expect(@league.lowest_scoring_visitor).to eq("Sporting Kansas City")
    end  
  end
  
  describe "#lowest_scoring_home_team" do
    it "can name of the team with the lowest average score per game across all seasons when they are at home." do
      expect(@league.lowest_scoring_home_team).to eq("Sporting Kansas City")
    end 
  end
end 