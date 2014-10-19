require_relative './level.rb'
require_relative 'actors/player.rb'
require_relative './console.rb'

class Board
  attr_accessor :player, :current_level
  def initialize(params = {})
    @tiles = build_board
    @current_level = Level.new()
    $player = Player.new(level: @current_level)
    $console = Console.new(stack: ['Console Initiated'], width: 160)
  end

  def build_board
    @tilesheet = TileSheet.default_tilesheet()
  end

  def draw
    $console.draw(640,0,0)
    @current_level.draw(0,0)
    $player.draw(2)
  end
end