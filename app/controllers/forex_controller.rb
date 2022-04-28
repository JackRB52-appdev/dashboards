class ForexController < ApplicationController
  def home
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)

    @array_of_symbols = @parsed_data.fetch("symbols").keys

    render({:template => "forex/home_page.html.erb"})
    
  end

  def first_currency
    @currency1 = params.fetch(:currency1)
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)

    @array_of_symbols = @parsed_data.fetch("symbols").keys

    render({:template => "forex/first_currency.html.erb"})
  end

  def currency_pair
    @currency1 = params.fetch(:currency1)
    @currency2 = params.fetch(:currency2)

    @raw_data = open("https://api.exchangerate.host/convert?from=#{@currency1}&to=#{@currency2}").read
    @parsed_data = JSON.parse(@raw_data)

    @result = @parsed_data.fetch("result")

    render({:template => "forex/currency_pair.html.erb"})
  end
end