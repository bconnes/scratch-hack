class Tile
  attr_reader :image, :walkable, :items
  def initialize(params = {})
    @image = params[:image]
    @walkable = params[:walkable]
    @actor = params[:actor]
    @items = params[:items] || []
  end

  def draw(x, y, z)
    @image.draw(x, y, z)
    unless @items.empty?
      @items[0].draw(x, y, z + 1)
    end
  end

  def add_item(item)
    @items << item
  end

  def take_item(id)
    item = @items[id]
    @items.delete_at(id)
    return item
  end

  def display_items
    @items.each_with_index do |item, index|
      $window.log("#{index}: #{item.name}")
    end
  end

  def method_missing(method)
    case
      when method === :close
        $window.log('This can not be closed!')
      when method === :open
        $window.log('This can not be opened!')
      when method == :break
        $window.log('This can not be broken!')
      else
        nil
    end
  end
end