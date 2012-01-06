Rails.application.routes.draw do
  resources :search_histories, :only => [:index, :show, :destroy]
end
