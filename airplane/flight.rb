 class Flight
    
    def initialize(flight, seats)
      @seats = seats
    end

    def seats
      @seats
    end

    def window_seats
      window = []
      seats.each do |seat|
        if seat.window? 
          window << seat
        end
      end
      window
    end

    def aisle_seats 
      aisle = []
      seats.each do |seat|
        if seat.aisle?
          aisle << seat 
        end
      end
      aisle
    end
 
    def middle_seats
      middle_seat = []
      seats.each do |seat|
        if seat.middle_seat?
          middle_seat << seat
        end
      end
      return middle_seat
    end
end
