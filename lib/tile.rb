class Tile
  attr_reader :image, :walkable
  def initialize(params)
    @image = params[:image]
    @walkable = params[:walkable]
    @actor = params[:actor]
  end

  def draw(x, y, z)
    @image.draw(x, y, z)
  end

  def method_missing(method)
    nil
  end
end