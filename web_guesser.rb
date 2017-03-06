require 'sinatra'
require 'sinatra/reloader'

NUM = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = guesser(guess)
  erb :index, :locals => {:number => NUM, :message => message}

end

  def guesser(guess)
    if guess <= (NUM + 5) && guess > NUM
      message = "Too high!"
    elsif guess > (NUM + 5)
      message = "Way too high!"
    elsif guess >= (NUM - 5) && guess < NUM
      message = "Too low"
    elsif guess < (NUM - 5)
      message = "Way too low!"
    elsif guess == NUM
      message = "You got it right! The secret number is #{NUM}."
    end
  end
