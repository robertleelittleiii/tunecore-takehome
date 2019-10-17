Rails.application.routes.draw do
  resources :songs do
    collection do
      get "search"
      get "find"
    end
  end
  resources :albums
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'songs#search'
end
