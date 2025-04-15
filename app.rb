require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get('/rock') do
  moves = ["rock", "paper", "scissors"]
  
  @comp_move = moves.sample

  if @comp_move == "rock"
    @outcome = "tied"
  elsif @comp_move == "paper"
    @outcome = "lost"
  else
    @outcome = "won"
  end
  
  erb(:rock)

end

get('/paper') do
  moves = ["rock", "paper", "scissors"]
  
  @comp_move = moves.sample

  if @comp_move == "rock"
    @outcome = "won"
  elsif @comp_move == "paper"
    @outcome = "tied"
  else
    @outcome = "lost"
  end
 
  erb (:paper)

end

get('/scissors') do
  moves = ["rock", "paper", "scissors"]
  
  @comp_move = moves.sample

  if @comp_move == "rock"
    @outcome = "lost"
  elsif @comp_move == "paper"
    @outcome = "won"
  else
    @outcome = "tied"
  end

  erb (:scissors)

end
