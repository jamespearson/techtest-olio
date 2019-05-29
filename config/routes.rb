Rails.application.routes.draw do
  
  resources :posts, only: [:index, :show, :destroy] do
    resources :likes, only: [:create] do
      collection do
        delete 'destroy'
      end
    end

  end
  
  root "posts#index"
end
