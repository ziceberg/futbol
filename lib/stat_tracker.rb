require 'CSV'
require './lib/game_manager'
require './lib/team_manager'
require './lib/game_teams_manager'
require './lib/modable'

class StatTracker

  attr_reader :game_manager, :game_teams_manager, :team_manager

  def self.from_csv(data)
    StatTracker.new(data)
  end

  def initialize(locations)

    game_path = locations[:games]
    team_path = locations[:teams]
    game_teams_path = locations[:game_teams]

    @game_teams_manager = GameTeamsManager.new(game_teams_path)

    @game_manager = GameManager.new(game_path)

    @team_manager = TeamManager.new(team_path)
  end
  
  def highest_total_score
    @game_manager.highest_total_score
  end


  def lowest_total_score
    @game_manager.lowest_total_score
  end

  def percentage_home_wins
   @game_teams_manager.percentage_home_wins
  end

  def percentage_visitor_wins
    @game_teams_manager.percentage_visitor_wins
  end

  def count_of_games_by_season
    games_by_season = @game_manager.create_games_by_season_array
    @game_manager.count_of_games_by_season(games_by_season)
  end

  #
  # def best_season(id)
  #   self.season_games(id)
  #   freq = @seasons.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   @seasons.max_by { |v| freq[v] }
  # end
  #
  # def worst_season(id)
  #   self.best_season(id)
  #   @seasons
  #   freq = seasons.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   seasons.min_by { |v| freq[v] }
  # end
  #
  # def average_win_percentage(id)
  #   self.best_season(id)
  #   @all_wins = (@away_wins + @home_wins)
  #   (@all_wins.length.to_f/@all_games.length.to_f).round(2)
  # end
  #
  # def most_goals_scored(id)
  #   self.best_season(id)
  #   self.goals(id)
  #   (@away + @home).sort[-1]
  # end
  #
  # def fewest_goals_scored(id)
  #   self.most_goals_scored(id)
  #   self.goals(id)
  #   (@away + @home).sort[0]
  # end
  #
  # def favorite_opponent(id)
  #   self.best_season(id)
  #   self.fav_opp2(id)
  # end
  #
  # def rival(id)
  #   self.rival1(id)
  #   games_played_against = @teams2.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   self.rival2(id)
  #   games_won_against = @teams1.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   hash1 = games_won_against.merge(games_played_against){ |k, a_value, b_value| a_value .to_f / b_value.to_f}
  #   hash1.delete("14")
  #   team_final = hash1.max_by{|k,v| v}[0]
  #   @teams_array.select{ |row| row.team_id == team_final}[0].team_name
  # end
  #
  # def count_of_teams
  #  @teams_array.size
  # end
  #
  # def best_offense
  #   @game_teams_array.teams_sort_by_average_goal.last.team_name
  # end
  #
  # def worst_offense
  #   @game_teams_array.teams_sort_by_average_goal.first.team_name
  # end
  #
  # def team_average_goals(team_id)
  #   @game_teams_array.team_average_goals(team_id)
  # end
  #
  # def highest_visitor_team
  #   @game_teams_array.highest_visitor_team
  # end
  #
  # def highest_home_team
  #   @game_teams_array.highest_home_team
  # end
  #
  # def lowest_visitor_team
  #   @game_teams_array.lowest_visitor_team
  # end
  #
  # def lowest_home_team
  #   @game_teams_array.lowest_home_team
  # end

  def team_info(id)
    @team_manager.team_info(id)
  end

  def best_season(id)
    @game_manager.best_season(id)
  end

  def worst_season(id)
    @game_manager.worst_season(id)
  end

  def average_win_percentage(id)
    @game_manager.average_win_percentage(id)
  end

  def most_goals_scored(id)
    @game_manager.most_goals_scored(id)
  end

  def fewest_goals_scored(id)
    @game_manager.fewest_goals_scored(id)
  end

  def favorite_opponent(id)
    number = @game_manager.favorite_opponent(id)
    @team_manager.teams_array.select{ |team| team.team_id == number}[0].team_name
  end

  def rival(id)
    number = @game_manager.rival(id)
    @team_manager.teams_array.select{ |team| team.team_id == number}[0].team_name
  end

  def count_of_teams
    @team_manager.size
  end
end

    # =======  JOHN'S CODE BEING WORKED ON  ==========
    # def best_offense
    #   @game_teams_array.teams_sort_by_average_goal.last.team_name
    # end
    #
    # def worst_offense
    #   @game_teams_array.teams_sort_by_average_goal.first.team_name
    # end
    #
    # def team_average_goals(team_id)
    #   @game_teams_array.team_average_goals(team_id)
    # end
    #
    # def highest_visitor_team
    #   @game_teams_array.highest_visitor_team
    # end
    #
    # def highest_home_team
    #   @game_teams_array.highest_home_team
    # end
    #
    # def lowest_visitor_team
    #   @game_teams_array.lowest_visitor_team
    # end
    #
    # def lowest_home_team
    #   @game_teams_array.lowest_home_team
    # end
    # =======  JOHN'S CODE BEING WORKED ON  ==========



  # def lowest_total_score
  #   @game_manager.lowest_total_score
  # end
  #
  # def percentage_home_wins
  #  @game_teams_manager.percentage_home_wins
  # end
  #
  # def percentage_visitor_wins
  #   @game_teams_manager.percentage_visitor_wins
  # end
  #
  # def team_info(id)
  #   hash= {}
  #   team = @team_hash.values.select{ |x| x.team_id == "#{id}"}[0]
  #   hash["team id"] = team.team_id
  #   hash["franchise_id"] = team.franchise_id
  #   hash["team_name"] = team.team_name
  #   hash["abbreviation"] = team.abbreviation
  #   hash["link"] = team.link
  #   hash
  # end
  #
  # def best_season(id)
  #   self.season_games(id)
  #   freq = @seasons.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   @seasons.max_by { |v| freq[v] }
  # end
  #
  # def worst_season(id)
  #   self.best_season(id)
  #   @seasons
  #   freq = seasons.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   seasons.min_by { |v| freq[v] }
  # end
  #
  # def average_win_percentage(id)
  #   self.best_season(id)
  #   @all_wins = (@away_wins + @home_wins)
  #   (@all_wins.length.to_f/@all_games.length.to_f).round(2)
  # end
  #
  # def most_goals_scored(id)
  #   self.best_season(id)
  #   self.goals(id)
  #   (@away + @home).sort[-1]
  # end
  #
  # def fewest_goals_scored(id)
  #   self.most_goals_scored(id)
  #   self.goals(id)
  #   (@away + @home).sort[0]
  # end
  #
  # def favorite_opponent(id)
  #   self.best_season(id)
  #   self.fav_opp2(id)
  # end
  #
  # def rival(id)
  #   self.rival1(id)
  #   games_played_against = @teams2.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   self.rival2(id)
  #   games_won_against = @teams1.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   hash1 = games_won_against.merge(games_played_against){ |k, a_value, b_value| a_value .to_f / b_value.to_f}
  #   hash1.delete("14")
  #   team_final = hash1.max_by{|k,v| v}[0]
  #   @teams_array.select{ |row| row.team_id == team_final}[0].team_name
  # end
  #
  # def count_of_teams
  #  @teams_array.size
  # end
  #
  # def best_offense
  #   @game_teams_array.teams_sort_by_average_goal.last.team_name
  # end
  #
  # def worst_offense
  #   @game_teams_array.teams_sort_by_average_goal.first.team_name
  # end
  #
  # def team_average_goals(team_id)
  #   @game_teams_array.team_average_goals(team_id)
  # end
  #
  # def highest_visitor_team
  #   @game_teams_array.highest_visitor_team
  # end
  #
  # def highest_home_team
  #   @game_teams_array.highest_home_team
  # end
  #
  # def lowest_visitor_team
  #   @game_teams_array.lowest_visitor_team
  # end
  #
  # def lowest_home_team
  #   @game_teams_array.lowest_home_team
  # end


# game_path = './data/games.csv'
# team_path = './data/teams.csv'
# game_teams_path = './data/game_teams.csv'
#
# locations = {
#   games: game_path,
#   teams: team_path,
#   game_teams: game_teams_path
# }
#
# stats = StatTracker.from_csv(locations)
# p stats.rival(18)
