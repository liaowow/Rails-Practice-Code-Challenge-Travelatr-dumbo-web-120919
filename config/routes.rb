Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:index, :create, :new, :show, :edit, :update]
  resources :destinations, only: [:index, :create, :new, :show, :edit, :update]
  resources :posts

  post '/posts/:id' => 'posts#add_like', as: "like"
end
