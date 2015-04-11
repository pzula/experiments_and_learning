
  #                                           ********
  #                                          *      *
  #                                         *      *
  #      ***********************************      *
  #    *  (  )      () () () () () ()            *
  #  *           *        *                   *
  # *             *        *               *
  #  ************************************
  #                  *       *
  #                   *********
  #
  # Dear Developer,
  #
  #   We closed another round of funding. Woot! I guess we're able to keep the
  #   the two of us around and the lights on for another few weeks before our
  #   next demo to our new masters...er, I mean investors.
  #
  #   We need to model airline seats so we can allow the booking agents to  put
  #   people in them. I started to build something but I wasn't able to finish
  #   everything and I am pretty sure THERE ARE BUGS. I would finish it but
  #   I am heading out to the big "Start Up Week" party.
  #
  #   Oh, yeah would you finish and fix this code for me?
  #                                                 Sincerely,
  #                                                   Minimum Viable Developer
  #
  #   P.S. Aren't these company t-shirts so soft?


  class AirlineSeat
    attr_accessor :taken

    def initialize(seat_number)
      @seat_number = seat_number
      @taken = false
    end

    def seat_number
      @seat_number
    end

    def row
      # TODO: I don't think this works for all seats
      seat_number[0..-1]
      seat_number.gsub(/[a-zA-Z]/, "")
    end

    def position
      seat_number[0..-1]
      @position = seat_number.gsub(/[0-9]/, "")
    end

    # TODO: I am pretty sure that all our planes are 6 seats wide. So that means
    #   that seats A and F are window seats.
    #
    #
    #                          | A B C || D E F |

    def aisle?
      #C and D are aisle seats
      position == "C" || position == "D"
    end

    def window?
      #A and F are window seats
      position == "A" || position == "F"
    end

    def middle_seat?
      # B and E are middle seats
      position == "B" || position == "E"
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


