require 'gosu'
require 'probability'

require_relative './tilesheet.rb'
require_relative './board.rb'
require_relative './actor.rb'

class GameWindow < Gosu::Window
  attr_reader :board
  def initialize
    super(960, 640, false)
    self.caption = 'Hack'
    $window = self
    @board = Board.new()
    @mode = :player
    @messages = []
  end

  def update
    clear_temps
  end

  def draw
    @board.draw
  end

  def tick
    @board.tick
  end

  def button_down(id)
    if @mode == :player
      if id == Gosu::KbLeft
        $player.move(:left)
      end

      if id == Gosu::KbRight
        $player.move(:right)
      end

      if id == Gosu::KbUp
        $player.move(:up)
      end

      if id == Gosu::KbDown
        $player.move(:down)
      end

      if id == Gosu::KbO
        @mode = :open
        temp_log('Choose a direction to open!')
      end

      if id == Gosu::KbC
        @mode = :close
        temp_log('Choose a direction to close!')
      end

      if id == Gosu::KbB
        @mode = :break
        temp_log('Choose a direction to break!')
      end

      if id == Gosu::KbP
        @mode = :pick_up
        log('Choose an item to pick up!')
        @board.level.display_items_at($player.x, $player.y)
      end

      if id == Gosu::KbD
        @mode = :drop
        log('Choose an item to drop!')
        $player.display_items
      end

      if id == Gosu::KbR
        @mode = :rest
        temp_log('How many turns would you like to rest? (1 - 10)')
      end

    elsif @mode == :open
      if id == Gosu::KbLeft
        @board.level.left_of($player.x, $player.y).open
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.level.right_of($player.x, $player.y).open
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.level.above($player.x, $player.y).open
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.level.below($player.x, $player.y).open
        @mode = :player
      end

    elsif @mode == :close
      if id == Gosu::KbLeft
        @board.level.left_of($player.x, $player.y).close
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.level.right_of($player.x, $player.y).close
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.level.above($player.x, $player.y).close
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.level.below($player.x, $player.y).close
        @mode = :player
      end

    elsif @mode == :break
      if id == Gosu::KbLeft
        @board.level.left_of($player.x, $player.y).break
        @mode = :player
      end

      if id == Gosu::KbRight
        @board.level.right_of($player.x, $player.y).break
        @mode = :player
      end

      if id == Gosu::KbUp
        @board.level.above($player.x, $player.y).break
        @mode = :player
      end

      if id == Gosu::KbDown
        @board.level.below($player.x, $player.y).break
        @mode = :player
      end

    elsif @mode == :pick_up
      number = get_number_from_id(id)
      item = @board.level.pick_up_item_at($player.x, $player.y, number)
      if item
        $player.get_item(item)
      else
        log('No item with that ID.')
      end
      @mode = :player

    elsif @mode == :drop
      number = get_number_from_id(id)
      $player.drop(number)
      @mode = :player

    elsif @mode == :rest
      number = get_number_from_id(id)
      number.times do
        $player.rest
      end
      log("Rested #{number} times.")
      @mode = :player
    end

  end

  def get_number_from_id(id)
    i = id.inspect.to_i
    if i == 39
      index = 0
    else
      index = i - 29
    end
    return index
  end

  def log(message)
    $console.log(message)
  end

  def temp_log(message)
    @messages << $console.log(message)
  end

  def clear_temps
    if @mode == :player
      if @messages
        @messages.sort.reverse.each do |id|
          $console.remove(id)
        end
        @messages = []
      end
    end
  end
end

window = GameWindow.new
window.show
