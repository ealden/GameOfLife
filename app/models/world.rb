class World
  def initialize
    @lives = {}
  end

  def spawn_life x:, y:
    key = { x: x, y: y }

    north_key = { x: x, y: (y - 1) }
    south_key = { x: x, y: (y + 1) }
    east_key  = { x: (x + 1), y: y }
    west_key  = { x: (x - 1), y: y }

    life = Life.new

    life.north  = @lives[north_key] if @lives.has_key? north_key
    life.south  = @lives[south_key] if @lives.has_key? south_key
    life.east   = @lives[east_key]  if @lives.has_key? east_key
    life.west   = @lives[west_key]  if @lives.has_key? west_key

    @lives[key] = life
  end

  def turn!
    dead = @lives.reject { |k, v| v.survives? }

    @lives.keep_if { |k, v| v.survives? }

    dead.each { |k, v| v.rip! }
  end

  def survivors
    @lives.keys
  end
end
