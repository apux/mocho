require 'test_helper'
require 'chinese_checkers/space'

module ChineseCheckers
  class TestSpace < Minitest::Test
    def test_it_stores_x_y_and_piece
      a_piece = "a piece"
      space = Space.new(x: 4, y: 7, piece: a_piece)

      assert_equal 4, space.x
      assert_equal 7, space.y
      assert_equal a_piece, space.piece
    end

    def test_it_can_be_created_with_no_piece
      space = Space.new(x: 4, y: 7)

      assert_equal nil, space.piece
    end

    def test_it_allows_to_modify_x_and_y
      space = Space.new(x: 4, y: 7)
      space.x = 5
      space.y = 1

      assert_equal 5, space.x
      assert_equal 1, space.y
    end

    def test_put_stores_a_piece
      a_piece = "a piece"
      space = Space.new(x: 4, y: 7)

      space.put a_piece

      assert_equal a_piece, space.piece
    end

    def test_remove_returns_the_piece
      a_piece = "a piece"
      space = Space.new(x: 4, y: 7)

      space.put a_piece

      assert_equal a_piece, space.remove_piece
    end

    def test_remove_removes_the_piece
      a_piece = "a piece"
      space = Space.new(x: 4, y: 7, piece: a_piece)

      space.remove_piece

      assert_equal nil, space.piece
    end

    def test_it_is_available_when_it_has_no_piece
      assert Space.new(x: 4, y: 7).available?
    end

    def test_it_is_not_available_when_it_has_a_piece
      refute Space.new(x: 4, y: 7, piece: "a piece").available?
    end

    def test_it_is_on_the_left_if_x_position_is_two_spaces_on_the_left_and_y_position_is_the_same
      space_1 = Space.new(x: 4, y: 7)
      space_2 = Space.new(x: 2, y: 7)

      assert space_2.left?(space_1)
    end

    def test_it_is_not_on_the_left_if_x_position_is_two_spaces_on_the_left_but_y_position_is_not_the_same
      space_1 = Space.new(x: 4, y: 7)
      space_2 = Space.new(x: 2, y: 6)

      refute space_2.left?(space_1)
    end

    def test_it_is_not_on_the_left_if_x_position_is_not_two_spaces_on_the_left_but_y_position_is_the_same
      space_1 = Space.new(x: 4, y: 7)
      space_2 = Space.new(x: 9, y: 7)

      refute space_2.left?(space_1)
    end
  end
end
