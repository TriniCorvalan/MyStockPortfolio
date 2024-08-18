# Stock Class
# Represents a stock in the portfolio.
# Attributes:
#   - symbol: The stock symbol (e.g., "AAPL" for Apple).
#   - price_data: A hash containing dates as keys and stock prices as values.
# Methods:
#   - price(date): Returns the stock price on a specific date.

class Stock
  attr_reader :symbol

  def initialize(symbol, price_data)
    @symbol = symbol
    @price_data = price_data
  end

  # Returns the stock price on a specific date.
  # Raises an error if price data for the given date is not available.
  def price(date)
    raise "No price data for date: #{date}" unless @price_data.key?(date)

    @price_data[date]
  end
end
