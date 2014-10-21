require_relative '../action.rb'

class OpenAction < Action
  def initialize(params = {})
    @action = :open
    @requirement = :direction
    @actor = params[:actor] || $player
  end

  def setup
    $window.temp_log('Choose a direction to open!')
  end

  def execute(direction)
    @actor.open(direction)
  end
end