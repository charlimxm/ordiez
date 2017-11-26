Rails.application.routes.draw do

  get 'orders', to: 'delivery_orders#index'

  get 'orders/:order_id', to: 'delivery_orders#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
