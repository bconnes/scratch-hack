require_relative './level.rb'
require_relative 'actors/player.rb'
require_relative 'console.rb
'

class Board
  attr_accessor :player, :current_level
  def initialize(params)
    @window = params[:window]
    @tiles = build_board
    @current_level = Level.new(window: @window)
    @player = Player.new(window: @window, level: @current_level)
    $console = Console.new()
  end

  def build_board
    @tilesheet = TileSheet.default_tilesheet(window: @window)
  end

  def draw
    @current_level.draw(0,0)
    @player.draw
  end
end