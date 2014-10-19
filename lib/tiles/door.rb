require_relative '../tile.rb'

class Door < Tile
  attr_reader :open, :closed, :broken
  def initialize(params)
    @status = params[:status]
    @open = params[:open]
    @closed = params[:closed]
    @broken = params[:broken]
  end

  def draw(x, y, z)
    case
      when @status === :open
        @open.draw(x, y, z)
      when @status === :closed
        @closed.draw(x, y, z)
      when @status === :broken
        @broken.draw(x, y, z)
      else
        @open.draw
    end
  end

  def open
    @status = :open
  end

  def close
    @status = :closed
  end

  def break
    @status = :broken
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