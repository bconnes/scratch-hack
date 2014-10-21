require_relative '../action.rb'

class BreakAction < Action
  def initialize(params = {})
    @action = :break
    @requirement = :direction
    @actor = params[:actor] || $player
  end

  def setup
    $window.temp_log('Choose a direction to break!')
  end

  def execute(direction)
    @actor.break(direction)
  end
end