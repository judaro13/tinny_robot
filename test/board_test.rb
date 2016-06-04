require 'test_helper'

class BoardTest < Minitest::Test
  def setup
    @board = TinnyRobot::Board.new
  end

  def test_clear_board
    board = @board.clear_board
    assert_equal(Array, board.class)
    assert_equal(5, board.size)
  end

  def test_create_new_toy_seeing_to_west
    assert_equal("west", @board.create_or_update_toy("west"))
  end

  def test_place_toy_error_points
    assert_equal(nil, @board.place(1, -5, "north"))
    assert_equal(nil, @board.place(-1, 2, "north"))
  end

  def test_place_toy
    assert_equal(Array, @board.place(1, 1, "north").class)
  end

  def test_move_toy_to_left
    @board.place(1, 1, "north")
    @board.left
    assert_equal("west", @board.toy.face)
  end

  def test_move_toy_to_left
    @board.place(1, 1, "north")
    @board.right
    assert_equal("east", @board.toy.face)
  end

  def text_move_toy_to_next_spot
    @board.place(1, 1, "north")
    @board.move

    assert_equal(1, @board.point.x_point)
    assert_equal(2, @board.point.x_point)
  end

  def test_validate_first_move
    @board.move
    assert_equal(String, @board.error_msg.class)
  end
end
