class Item
  attr_reader :image, :name
  def initialize(params = {})
    @image = params[:image]
    @name = params[:name]
  end

  def draw(x, y, z)
    @image.draw(x, y, z)
  end
end