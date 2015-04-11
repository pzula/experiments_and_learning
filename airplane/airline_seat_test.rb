gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './airline_seat'

class AirlineSeatTest < Minitest::Test

  def test_airline_seat_has_method_seat_number
    assert AirlineSeat.instance_methods.include?(:seat_number)
  end

  def test_airline_seat_has_a_seat_number
    instance = AirlineSeat.new("11A")
    assert_equal "11A", instance.seat_number
  end

  def test_airline_seat_has_method_row
    assert AirlineSeat.instance_methods.include?(:row)
  end

  def test_airline_seat_has_the_correct_row
    instance = AirlineSeat.new("1A")
    assert_equal "1", instance.row

    instance = AirlineSeat.new("10A")
    assert_equal "10", instance.row
  end

  def test_airline_seat_has_method_position
    assert AirlineSeat.instance_methods.include?(:position)
  end

  def test_airline_seat_has_a_position
    instance = AirlineSeat.new("9F")
    assert_equal "F", instance.position
  end

  def test_airline_seat_has_correct_position
    instance = AirlineSeat.new("36C")
    assert_equal "C", instance.position
  end

  def test_airline_seats_on_the_windows_are_window_seats
    instance = AirlineSeat.new("10A")
    assert instance.window?
    refute instance.aisle?
    refute instance.middle_seat?

    instance = AirlineSeat.new("2F")
    assert instance.window?
    refute instance.aisle?
    refute instance.middle_seat?
  end

  def test_airline_seats_on_the_aisles_are_aisle_seats
    instance = AirlineSeat.new("6C")
    assert instance.aisle?
    refute instance.window?
    refute instance.middle_seat?

    instance = AirlineSeat.new("13D")
    assert instance.aisle?
    refute instance.window?
    refute instance.middle_seat?
  end

  def test_airline_seats_in_the_middle_are_middle_seats
    instance = AirlineSeat.new("2B")
    assert instance.middle_seat?
    refute instance.window?
    refute instance.aisle?

    instance = AirlineSeat.new("4E")
    assert instance.middle_seat?
    refute instance.window?
    refute instance.aisle?
  end

  def test_airline_seat_is_not_taken_when_first_created
    instance = AirlineSeat.new("22B")
    refute instance.taken?
  end

  def test_airline_seat_can_be_marked_as_taken
    instance = AirlineSeat.new("12F")
    instance.taken!
    assert instance.taken?
  end

end
