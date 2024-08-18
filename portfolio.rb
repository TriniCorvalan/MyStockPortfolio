# Portfolio Class
# Represents a portfolio of stocks.
# Methods:
#   - add_stock(stock): Adds a stock to the portfolio.
#   - profit(start_date, end_date): Calculates the profit and annualized return of the portfolio between two dates.
#      Also returns a diversification analysis of the portfolio by sector.

class Portfolio
  def initialize
    @stocks = []
  end

  # Adds a stock to the portfolio.
  def add_stock(stock)
    @stocks << stock
  end

  # Calculates the profit and annualized return of the portfolio between two dates.
  # Also performs a diversification analysis by sector at both dates
  # Returns a hash with keys :profit, :annualized_return, and :diversification.
  def profit(start_date, end_date)
    validate_dates(start_date, end_date)

    start_value = total_value(start_date)
    end_value = total_value(end_date)

    return nil if start_value == 0

    profit = end_value - start_value
    annualized_return = calculate_annualized_return(start_value, end_value, start_date, end_date)
    diversification = {
      start_date: calculate_diversification(start_date), end_date: calculate_diversification(end_date)
    }

    {
      profit: profit,
      annualized_return: annualized_return,
      diversification: diversification
    }
  end

  private

  # Validates that the provided dates are valid.
  # Raises an error if the start date is later than the end date or if price data is missing for any stock.
  def validate_dates(start_date, end_date)
    if start_date >= end_date
      raise "Start date must be earlier than end date."
    end
    if @stocks.any? { |stock| !stock.price(start_date) || !stock.price(end_date) }
      raise "Price data missing for one or more stocks on the given dates."
    end
  end

  # Calculates the total value of the portfolio on a specific date.
  def total_value(date)
    @stocks.sum { |stock| stock.price(date) }
  end

  # BONUS 1: ANUALIZED RETURN
  # Calculates the annualized return of the portfolio.
  # Uses the formula: ((Final Value / Initial Value) ^ (1 / Number of Years)) - 1
  def calculate_annualized_return(start_value, end_value, start_date, end_date)
    num_years = ((end_date - start_date).to_f / 365.25)
    ((end_value / start_value)**(1.0 / num_years)) - 1
  end

  # BONUS 2: DIVERSIFICATION
  # Performs a diversification analysis of the portfolio on a specific date
  # Categorizes stocks by sector and calculates the portfolio's percentage in each sector.
  def calculate_diversification(date)
    sectors = {}

    @stocks.each do |stock|
      sector = stock_sector(stock.symbol)  # Determines the market sector of the stok, e.g. Financial Services, IT, Energy, etc.
      sectors[sector] ||= { count: 0, value: 0 }
      sectors[sector][:count] += 1
      sectors[sector][:value] += stock.price(date)
    end

    total_value = total_value(date)
    sector_distribution = sectors.transform_values do |data|
      {
        percentage: (data[:value] / total_value.to_f * 100).round(2),
        count: data[:count]
      }
    end

    sector_distribution
  end

  # Helper method that assigns a sector to a stock based on its symbol.
  # This is a simple example; in a real-world scenario, a database or API would be used to obtain this information and more specific industriy also.
  def stock_sector(symbol)
    sectors = {
      "AAPL" => "Information Technology",
      "MSFT" => "Information Technology",
      "JPM" => "Financial Services",
      "SLB" => "Energy"
    }
    sectors[symbol] || "Unknown"
  end
end