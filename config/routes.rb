Rails.application.routes.draw do
  resources :search_histories, :only => [:index, :show, :destroy] do
    put :remove_all, :on => :collection
  end
end
