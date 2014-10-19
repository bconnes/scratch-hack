require_relative '../tile.rb'

class ItemTile < Tile
  attr_reader :items
  def initialize(params={})
    @items = params[:items] || []
    @base = params[:base]
  end

  def draw(x, y, z)
    if @base
      @base.draw(x, y, z)
    end

  end
end