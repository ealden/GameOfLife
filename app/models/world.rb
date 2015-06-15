class World
  def initialize
    @lives = {}
  end

  def spawn_life x:, y:
    key = { x: x, y: y }

    north_key = { x: x, y: (y - 1) }
    south_key = { x: x, y: (y + 1) }

    life = Life.new

    life.north  = @lives[north_key] if @lives.has_key? north_key
    life.south  = @lives[south_key] if @lives.has_key? south_key

    @lives[key] = life
  end

  def turn!
    @lives.keep_if { |k, v| v.survives? }
  end

  def survivors
    @lives.keys
  end
end
