require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = set_color(message)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, :message => message, :color => color}
end


  def check_guess(guess)
    if guess.to_i > SECRET_NUMBER + 5
      "Way too high!"
    elsif guess.to_i > SECRET_NUMBER
      "Too high!"
    elsif guess.to_i == SECRET_NUMBER
      "You've got it right! The secret number is #{SECRET_NUMBER}."
    elsif guess.to_i < SECRET_NUMBER - 5
      "Way too low!"
    elsif guess.to_i < SECRET_NUMBER
      "Too low!"
    end
  end

  def set_color(message)
    case message
    when "Way too high!" then return "red"
    when "Way too low!" then return "red"
    when "Too high!" then "tan"
    when "Too low!" then "tan"
    when "You've got it right! The secret number is #{SECRET_NUMBER}." then "green"
    end
  end