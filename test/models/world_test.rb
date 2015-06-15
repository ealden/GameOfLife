require 'test_helper'

class WorldTest < ActiveSupport::TestCase
  attr_accessor :subject

  def setup
    @subject = World.new
  end

  test 'lifeless world' do
    expected_survivors = []

    assert_equal expected_survivors, subject.survivors
  end

  test 'world gone extinct' do
    expected_survivors = []

    subject.spawn_life x: 0, y: 0
    subject.turn!

    assert_equal expected_survivors, subject.survivors
  end

  test 'two of us are not enough' do
    expected_survivors = []

    subject.spawn_life x: 0, y: 0
    subject.spawn_life x: 0, y: 1

    subject.turn!

    assert_equal expected_survivors, subject.survivors
  end

  test 'a survivor!' do
    expected_survivors = [
      { x: 0, y: 1 }
    ]

    subject.spawn_life x: 0, y: 0
    subject.spawn_life x: 0, y: 1
    subject.spawn_life x: 0, y: 2

    subject.turn!

    assert_equal expected_survivors, subject.survivors
  end

  test 'we are too many!' do
    expected_survivors = []

    subject.spawn_life x: 1, y: 0
    subject.spawn_life x: 0, y: 1
    subject.spawn_life x: 1, y: 1
    subject.spawn_life x: 2, y: 1
    subject.spawn_life x: 1, y: 2

    subject.turn!

    assert_equal expected_survivors, subject.survivors
  end
end
