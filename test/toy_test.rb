require 'test_helper'

class ToyTest < Minitest::Test
  def setup
    @toy = TinnyRobot::Toy.new
  end

  def test_new_toy_see_to_north
    assert_equal("north", @toy.face)
  end

  def test_toy_see_to_west
    @toy.face = 'west'
    assert_equal("west", @toy.face)
  end

  def test_toy_turn_to_left
    @toy.left
    assert_equal("west", @toy.face)
  end


  def test_toy_turn_to_right
    @toy.right
    assert_equal("east", @toy.face)
  end
end
