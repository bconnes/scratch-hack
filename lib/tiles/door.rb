require_relative '../tile.rb'

class DoorTile < Tile
  attr_reader :open, :closed, :broken
  def initialize(params = {})
    @status = params[:status]
    @open = params[:open]
    @closed = params[:closed]
    @broken = params[:broken]
    @base = params[:base]
  end

  def draw(x, y, z)
    if @base
      @base.draw(x, y, z)
    end
    case
      when @status === :open
        @open.draw(x, y, z + 1)
      when @status === :closed
        @closed.draw(x, y, z + 1)
      when @status === :broken
        @broken.draw(x, y, z + 1)
      else
        @open.draw(x, y, z + 1)
    end
  end

  def open
    if @status != :broken
      if @status == :open
        $window.log('This door is already open!')
      else
        @status = :open
        $window.log('Door Opened!')
        $window.tick
      end
    else
      $window.log("Can't open a broken door!")
    end
  end

  def close
    if @status != :broken
      if @status == :closed
        $window.log('This door is already closed!')
      else
        @status = :closed
        $window.log('Door Closed!')
        $window.tick
      end
    else
      $window.log("Can't open a closed door!")
    end
  end

  def break
    if @status == :broken
      $window.log("This door is already broken!")
    else
      @status = :broken
      $window.log("You broke the door!")
      $window.tick
    end
  end

  def walkable
    case
    when @status === :open
      true
    when @status === :broken
      true
    else
      false
    end
  end
end