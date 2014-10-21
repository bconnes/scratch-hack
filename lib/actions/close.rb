require_relative '../action.rb'

class CloseAction < Action
  def initialize(params = {})
    @action = :close
    @requirement = :direction
    @actor = params[:actor] || $player
  end

  def setup
    $window.temp_log('Choose a direction to close!')
  end

  def execute(direction)
    @actor.close(direction)
  end
end