Rottenpotatoes::Application.routes.draw do
  #rake routes
  resources :movies #creates routes for the diffetent controller methods
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  #set up new route for controller action of search movies by director
  #when search method is called from controller, it will reutrn "/similar_movies/:title", and search_similar_movies_path and search_similar_movies_url will be 
  #created as route helpers by the "as:" below
  get 'similar_movies/:title' => 'movies#search', as: :search_similar_movies
end


#get 'movies/:id/similar_movies', to: 'movies#similar_movies', :as => :similar_movies