class Console
  def initialize(params = {})
    @stack = params[:stack]
    @width = params[:width]
  end

  def draw(x, y, z)
    current_x = x
    current_y = y
    @stack.each do |message|
      entry = Gosu::Image.from_text($window, message, Gosu::default_font_name, 14, 8, @width, :left)
      entry.draw(current_x, current_y, z)
      current_y += 8 + entry.height
    end
  end

  def log(message)
    @stack << message
    @stack.length - 1
  end

  def remove(id)
    @stack.delete_at(id)
  end
end