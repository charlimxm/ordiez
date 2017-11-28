Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/api'  do

  get 'orders', to: 'delivery_orders#index'

  get 'orders/:order_id', to: 'delivery_orders#show'

  get 'orders/:order_id/feedbacks', to: 'feedbacks#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
