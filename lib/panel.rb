class Panel
  def initialize(params = {})
    @width = params[:width]
  end

  def draw(x, y, z)
    current_y = y
    health = Gosu::Image.from_text($window, "Health: #{$player.health}/#{$player.max_health} | Turns: #{$window.board.turns}", Gosu::default_font_name, 14, 8, @width, :left)
    health.draw(x, current_y, z)
    current_y += health.height
    $player.items.each_with_index do |item, index|
      current_x = x
      number = Gosu::Image.from_text($window, index, Gosu::default_font_name, 14, 8, 16, :left)
      number.draw(current_x, current_y, z)
      current_x += 16
      image = item.image
      image.draw(current_x, current_y, z)
      current_x += 16
      entry = Gosu::Image.from_text($window, item.name, Gosu::default_font_name, 14, 8, @width - 32, :left)
      entry.draw(current_x, current_y, z)
      current_y += 8 + entry.height
    end
  end
end