Rails.application.routes.draw do
  
  resources :posts do
  end
  
  root "posts#index"
end
