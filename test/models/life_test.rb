require 'test_helper'

class LifeTest < ActiveSupport::TestCase
  attr_accessor :subject

  def setup
    @subject = Life.new
  end

  test 'will not survive if alone' do
    refute subject.survives?
  end

  test 'will survive with two neighbors' do
    subject.north  = Life.new
    subject.south = Life.new

    assert subject.survives?
  end

  test 'neighbor to the north' do
    neighbor = Life.new

    subject.north = neighbor

    assert_equal neighbor, subject.north
    assert_equal subject, neighbor.south
  end

  test 'neighbor to the south' do
    neighbor = Life.new

    subject.south = neighbor

    assert_equal neighbor, subject.south
    assert_equal subject, neighbor.north
  end

  test 'neighbor to the east' do
    neighbor = Life.new

    subject.east = neighbor

    assert_equal neighbor, subject.east
    assert_equal subject, neighbor.west
  end

  test 'neighbor to the west' do
    neighbor = Life.new

    subject.west = neighbor

    assert_equal neighbor, subject.west
    assert_equal subject, neighbor.east
  end

  test 'three neighbors are still ok' do
    subject.north = Life.new
    subject.east  = Life.new
    subject.west  = Life.new

    assert subject.survives?
  end

  test 'has neighbors?' do
    subject.north = Life.new

    assert subject.has_neighbors?
  end

  test 'no neighbors?' do
    refute subject.has_neighbors?
  end

  test 'goes extinct' do
    north_neighbor  = Life.new
    south_neighbor  = Life.new
    east_neighbor   = Life.new
    west_neighbor   = Life.new

    subject.north = north_neighbor
    subject.south = south_neighbor
    subject.east  = east_neighbor
    subject.west  = west_neighbor

    subject.rip!

    assert_nil north_neighbor.south
    assert_nil south_neighbor.north
    assert_nil east_neighbor.west
    assert_nil west_neighbor.east

    refute north_neighbor.has_neighbors?
    refute south_neighbor.has_neighbors?
    refute east_neighbor.has_neighbors?
    refute west_neighbor.has_neighbors?
  end
end
