require 'httparty'
require 'json'

def get_crypto_data
  url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def display(crypto)
  name = crypto['name']
  current_price = crypto['current_price']
  market_cap = crypto['market_cap']

  puts "Name:                   #{name}"
  puts "Current Price:          #{current_price}"
  puts "Market Capitalization:  #{market_cap}"
  puts "----------------------------------"
end

def sort(cryptos)
  cryptos.sort_by {|crypto| crypto['market_cap']}
end

def top_5(cryptos)
  top_five = cryptos.first(5)
  puts "Top 5 Crypto Currencies by market capitalization"
  puts "------------------------------------------------"
  top_five.each do |crypto|
    display(crypto)
  end

end

cryptos = get_crypto_data
sorted_cryptos = sort(cryptos)
top_5(sorted_cryptos)
