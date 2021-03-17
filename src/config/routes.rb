Rails.application.routes.draw do
  root 'book_logs#index'
  resources :book_logs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
