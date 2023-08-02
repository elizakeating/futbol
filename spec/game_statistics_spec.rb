require "spec_helper"

RSpec.describe GameStatistics do
  before :each do
    @game_stats = GameStatistics.new
  end

  describe "#highest_total_score" do
    it "finds the highest total score from stat data" do
      expect(@game_stats.highest_total_score).to eq(5)
    end
  end

  describe "lowest_total_score" do
    it "finds the lowest total score from stat data" do
      expect(@game_stats.lowest_total_score).to eq(1)
    end
  end

  describe "percentage_home_wins" do
    it "finds percentage of games that a home team has won(rounded to nearedst 100th)" do
      expect(@game_stats.percentage_home_wins).to eq(0.68)
    end
  end

end