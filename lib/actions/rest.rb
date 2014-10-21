require_relative '../action.rb'

class RestAction < Action
  def initialize(params = {})
    @action = :rest
    @requirement = :integer
    @actor = params[:actor] || $player
  end

  def setup
    $window.temp_log('Rest for how many turns?')
  end

  def execute(integer)
    integer.times do
      @actor.rest
    end
  end
end