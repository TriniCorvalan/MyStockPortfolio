# Portfolio Management System

This project implements a simple yet robust portfolio management system in Ruby. The system allows users to track the value of a portfolio consisting of multiple stocks, calculate profits between two dates, and analyze the portfolio's diversification.

## Features

- **Add Stocks:** Add multiple stocks to the portfolio.
- **Calculate Profit:** Calculate the profit of the portfolio between two specified dates.
- **Annualized Return:** Calculate the annualized return based on the portfolio's performance over a period of time.
- **Diversification Analysis:** Analyze the portfolio's diversification across different sectors on specific dates.

## Installation

1. Clone the repository:

```bash
  git clone https://github.com/your-username/portfolio-management.git
```

2. Navigate to the project directory:

```bash
  cd my-stock-portfolio
```

## Usage

1. Initialize Stocks:
   Create instances of the Stock class by providing a stock symbol and historical price data.

```ruby
price_data_aapl = { Date.new(2022, 1, 1) => 150, Date.new(2023, 1, 1) => 170 }
aapl = Stock.new("AAPL", price_data_aapl)
```

2. Create a Portfolio:
   Instantiate the Portfolio class and add stocks to it.

```ruby
portfolio = Portfolio.new
portfolio.add_stock(aapl)
```

3. Calculate Profit and Annualized Return:
   Use the profit method to calculate the profit and annualized return of the portfolio between two dates.

```ruby
result = portfolio.profit(Date.new(2022, 1, 1), Date.new(2023, 1, 1))
puts "Profit: #{result[:profit]}"
puts "Annualized Return: #{(result[:annualized_return] * 100).round(2)}%"
puts "Diversification: #{result[:diversification]}"

```

## Example

There is an example of how to use the portfolio management system at the [examples.rb file](./examples.rb)
