class Panel
  def initialize(params = {})
    @width = params[:width]
  end

  def draw(x, y, z)
    current_y = y
    current_x = x
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
      if $player.wielded_item == item
        @symbol_sheet ||= Gosu::Image.load_tiles($window, '../media/GUI/GUI1.png', 16, 16, false)
        wield_symbol = @symbol_sheet[60]
        wield_symbol.draw(current_x, current_y, z)
        current_x += 16
      end
      entry = Gosu::Image.from_text($window, item.name, Gosu::default_font_name, 14, 8, @width - 32, :left)
      entry.draw(current_x, current_y, z)
      current_y += 8 + entry.height
    end
    if $window.text_input
      current_x = x
      text_input = Gosu::Image.from_text($window, "Input: #{$window.text_input.text}", Gosu::default_font_name, 14, 8, @width, :left)
      text_input.draw(current_x, current_y, z)
    end
  end
end