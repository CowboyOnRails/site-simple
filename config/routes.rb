Newage::Application.routes.draw do
 
  mount ImperaviRails::Engine => "/imperavi"

  resource :location, :only =>[:edit,:update], :defaults => { :id =>1 }
  resource :feedback, :only => [:new, :create]

  resources :images, :only => [:index, :create]

  resources :articles do
    resource :metaitems, :only => [:edit, :update]
  end

  root :to => 'articles#index'
  
  match '/:id' => 'articles#show', :constraints => { :id => /\d.+/ }
  
end
