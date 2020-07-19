require "./test/test_helper.rb"
require './lib/team.rb'
class StatTrackerTest < MiniTest::Test

  def setup
    @team = StatTracker.from_csv(Team, './data/teams.csv')
  end

  def test_it_can_count_number_of_teams
    assert_equal 32, StatTracker.count_of_teams
  end
end
