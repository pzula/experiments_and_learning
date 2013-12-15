gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './flight.rb'

class FlightTest < Minitest::Test

  def test_flight_must_be_created_with_seats

    # TODO: If I wasn't leaving the company I would probably come up with some
    #   way to create all these seats dynamically. Right now I only made 1 row
    #   of seats. But our planes actually have 21 rows of seats.
    #
    #   Maybe I could use ruby's Ranges to solve the problem. Whatever! I'm
    #   going to program in Python starting next week. Ruby is lame anyways.
    #   Hopefully you can figure it out.


    # rows = ("1".."21").to_a
    # letters = ("A".."F").to_a
    # possible_seats = []

    # rows.each do |row|
    #   letters.each do |letter|
    #     possible_seats << row + letter
    #   end
    # end

    # seats = []
    # possible_seats.each do |seat|
    #   seats << seat
    # end

    # above works, but a more elegant way:

    seats = []

    (1..21).each do |row|
      ("A".."F").each do |position|
        seats.push AirlineSeat.new("#{row}#{position}")
      end
    end

    flight = Flight.new("DC444",seats)
    assert_equal 126, flight.seats.count
  end

  def test_flight_window_seats_returns_all_the_window_seats
    seats = []

    (1..21).each do |row|
      ("A".."F").each do |position|
        seats.push AirlineSeat.new("#{row}#{position}")
      end
    end

    flight = Flight.new("DC444",seats)
    assert_equal 42, flight.window_seats.count
  end

  def test_flight_window_seats_returns_all_the_aisle_seats

    seats = []

    (1..21).each do |row|
      ("A".."F").each do |position|
        seats.push AirlineSeat.new("#{row}#{position}")
      end
    end

    flight = Flight.new("HI667",seats)
    assert_equal 42, flight.aisle_seats.count
  end

  def test_flight_window_seats_returns_all_the_middle_seats

    seats = []

    (1..21).each do |row|
      ("A".."F").each do |position|
        seats.push AirlineSeat.new("#{row}#{position}")
      end
    end

    flight = Flight.new("FR343",seats)
    assert_equal 42, flight.middle_seats.count
  end

  def test_flight_can_return_the_seat_by_seat_number
    skip

    seat_01 = AirlineSeat.new("1A")
    seat_02 = AirlineSeat.new("1B")
    seat_03 = AirlineSeat.new("1C")
    seat_04 = AirlineSeat.new("1D")
    seat_05 = AirlineSeat.new("1E")
    seat_06 = AirlineSeat.new("1F")

    seats = [ seat_01, seat_02, seat_03, seat_04, seat_05, seat_06 ]

    flight = Flight.new("HI667",seats)
    assert_equal seat_01, flight.seat("1A")
    assert_equal seat_03, flight.seat("1C")
    assert_equal seat_04, flight.seat("1D")
    assert_equal seat_06, flight.seat("1F")
  end


  #
  # The remaining code here is working code that assists with the above tests
  # You shouldn't have to make changes to the code below this point to make
  # the test to pass. However, you will definitely need to read the code
  #

  class AirlineSeat
    def initialize(seat_number)
      @seat_number = seat_number
    end

    def seat_number
      @seat_number
    end

    def row
      seat_number[0..-2]
    end

    def position
      seat_number[-1]
    end

    def window?
      position == "A" || position == "F"
    end

    def aisle?
      position == "C" || position == "D"
    end

    def middle_seat?
      ! window? && ! aisle?
    end

    def taken?
      @taken
    end

    def taken!
      @taken = true
    end

    def legroom?
      # TODO: Next version of our seats will definitely have legroom. I promise!
      false
    end
  end

end
