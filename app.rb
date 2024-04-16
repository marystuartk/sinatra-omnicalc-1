
require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do

erb(:square)
end

get("/square/result") do
  @the_num = params.fetch("mary").to_f

  @the_square = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do

  erb(:square_root)
  end

get("/square_root/result") do
  @input = params.fetch("num").to_f

  @root = @input ** 0.5

  erb(:square_root_results)
end


get("/random/new") do
  erb(:random)
end

get("/random/result") do
  @minimum = params.fetch("user_min").to_f
  @maximum = params.fetch("user_max").to_f

  @random_number = rand(@minimum..@maximum).to_f
  erb(:random_results)
end


get("/payment/new") do

erb(:payment)
end

get("/payment/results") do

  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f

  period_rate = @apr / 1200
  periods = @years * 12

  numerator = period_rate * @principal
  denominator = 1 - (1 + period_rate) ** (-1 * periods)

  @monthly_payment = (numerator/denominator).to_fs(:currency)
  erb(:payment_results)
end
