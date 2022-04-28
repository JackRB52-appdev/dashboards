Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("forex", {:controller => "forex", :action => "home"})

  get("forex/:currency1", {:controller => "forex", :action => "first_currency"})

  get("forex/:currency1/:currency2", {:controller => "forex", :action => "currency_pair"})


end
