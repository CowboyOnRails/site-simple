Newage::Application.routes.draw do
 
  devise_for :users
  devise_scope :user do
   get "login", :to => "devise/sessions#new"
   get "logout", :to => "devise/sessions#destroy"
  end

  mount ImperaviRails::Engine => "/imperavi"

  resource :location, :only =>[:edit,:update], :defaults => { :id =>1 }
  resources :feedbacks, :only => [:new, :create]

  resources :images, :only => [:index, :create]

  resources :articles do
    resource :metaitems, :only => [:edit, :update]
  end

  root :to => 'articles#index'
  
  match '/:id' => 'articles#show', :constraints => { :id => /\d.+/ }
  
end
