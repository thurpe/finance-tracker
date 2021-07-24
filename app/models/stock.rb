class Stock < ActiveRecord::Base

    def self.new_from_lookup(ticker_symbol)
        begin
            StockQuote::Stock.new(api_key: 'pk_96cb823eb97349669920a7bfa27b9f13')
            looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
            new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
        rescue Exception => e
            return nil
        end
    end

end
