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
end
