require_relative '../action.rb'
class NoActionAction < Action
  def initialize(params = {})
    @requirement = false
    @actor = params[:actor] || $player
  end

  def execute
    $window.temp_log('No Action')
  end
end
