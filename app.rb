require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @user_number = params.fetch("number").to_f
  square = @user_number * @user_number
  @number_square = square.round(4)
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @user_number = params.fetch("user_number").to_f
  @square_rt = Math.sqrt(@user_number)
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/payment/results") do
  @ap_rate = params.fetch("user_apr").to_f
  @ap_rate_formatted = @ap_rate.to_fs(:percentage, {:precision => 4})
  @number_of_years = params.fetch("user_years").to_i
  number_of_months = @number_of_years * 12
  @principal_amount = params.fetch("user_principal").to_f
  @principal_amount_formatted = @principal_amount.to_fs(:currency)

  r = @ap_rate / 1200

  numerator = r * @principal_amount
  denominator = 1 - (1 + r)**-number_of_months
  @payment = numerator / denominator
  @payment_formatted = @payment.to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/random/results") do
@min_num_pick = params.fetch("min_num").to_f
@max_num_pick = params.fetch("max_num").to_f
@random_number = rand(@min_num_pick..@max_num_pick).to_f
  erb(:random_results)
end
