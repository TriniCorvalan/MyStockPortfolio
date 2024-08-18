require './stock.rb'
require  './portfolio.rb'
require 'date'
require 'json'


# example price data
price_data_aapl = {
  Date.new(2022, 1, 1) => 150.0,
  Date.new(2023, 1, 1) => 170.0
}
price_data_msft = {
  Date.new(2022, 1, 1) => 300.0,
  Date.new(2023, 1, 1) => 320.0
}
price_data_jpm = {
  Date.new(2022, 1, 1) => 160.0,
  Date.new(2023, 1, 1) => 165.0
}
price_data_slb = {
  Date.new(2022, 1, 1) => 160.0,
  Date.new(2023, 1, 1) => 165.0
}

# create stocks instances
aapl = Stock.new("AAPL", price_data_aapl)
msft = Stock.new("MSFT", price_data_msft)
jpm = Stock.new("JPM", price_data_jpm)
sbl = Stock.new("SLB", price_data_slb)

# create portfolio and add instantiated stocks
portfolio = Portfolio.new
portfolio.add_stock(aapl)
portfolio.add_stock(msft)
portfolio.add_stock(jpm)
portfolio.add_stock(sbl)

# calculate profit, annualized return and diversification
result = portfolio.profit(Date.new(2022, 1, 1), Date.new(2023, 1, 1))

# print results
puts "Profit: #{result[:profit]}"
puts "Annualized Return: #{(result[:annualized_return] * 100).round(2)}%"
puts "Diversification start date: #{JSON.pretty_generate(result[:diversification][:start_date])}"
puts "Diversification end date: #{JSON.pretty_generate(result[:diversification][:end_date])}"