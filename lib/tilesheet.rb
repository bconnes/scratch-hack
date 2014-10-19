class TileSheet
  def initialize(params)
    @window = params[:window]
  end

  def self.default_tilesheet(params)
    require_relative './tilesheets/default.rb'
    return DefaultTileSheet.new(window: params[:window])
  end

  def tiles
    raise NotImplementedError
  end

  def wall
    raise NotImplementedError
  end

  def floor
    raise NotImplementedError
  end
end