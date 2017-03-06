require 'sinatra'
require 'sinatra/reloader'

NUM = rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = guesser(guess)
  color = background_color_assigner(guess)
  erb :index, :locals => {:number => NUM, :message => message, :color => color}

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

  def background_color_assigner(guess)
    if (guess <= (NUM + 5) && guess > NUM) || (guess >= (NUM - 5) && guess < NUM)
      color = "rgb(245, 231, 245)"
    elsif guess > (NUM + 5) || guess < (NUM - 5)
      color = "red"
    elsif guess == NUM
      color = "green"
    end
  end
