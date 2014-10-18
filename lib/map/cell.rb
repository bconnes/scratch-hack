class Cell
  def initialize(params = {})
    @char = params[:char]
  end

  def to_s
    @char || ' '
  end
end