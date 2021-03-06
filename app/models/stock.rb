class Stock < ApplicationRecord

	def self.new_lookup(ticker_symbol)
	  client = IEX::Api::Client.new(publishable_token: 'Tpk_ee776f9a47c4473bbb5e2d5775ee18e2', secret_token: 'Tsk_475b6e3c3eda4b798950ad3a55d0a1f9',
                                    endpoint: 'https://sandbox.iexapis.com/v1')
	  begin
	    new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
	  rescue => exception
	  	return nil 
	  end
    end
end