require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(100)
@@guesses = 0

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = set_color(message)
  erb :index, :locals => {:secret_number => @@secret_number, :message => message, :color => color}
end


  def check_guess(guess)
    @@guesses = @@guesses + 1
    if @@guesses < 5
      if guess.to_i > @@secret_number + 5
        "Way too high!"
      elsif guess.to_i > @@secret_number
        "Too high!"
      elsif guess.to_i == @@secret_number
        @@secret_number = rand(100)
        @@guesses = 0
        "You've got it right! The secret number is #{@@secret_number}. Play again!"
      elsif guess.to_i < @@secret_number - 5
        "Way too low!"
      elsif guess.to_i < @@secret_number
        "Too low!"
      end
    else
      @@secret_number = rand(100)
      @@guesses = 0
      "Too many guesses! Start guessing again!"
    end
  end

  def set_color(message)
    case message
    when "Way too high!" then return "red"
    when "Way too low!" then return "red"
    when "Too high!" then "tan"
    when "Too low!" then "tan"
    when "You've got it right! The secret number is #{@@secret_number}. Play again!" then "green"
    end
  end