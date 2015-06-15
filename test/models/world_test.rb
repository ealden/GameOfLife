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
end
