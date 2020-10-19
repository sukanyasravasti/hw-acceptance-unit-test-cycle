class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  #define method to find movie with same director
  def self.similar_movies(movie_title)
    #byebug
    director = self.where(title: movie_title).pluck(:director)
    print director[0]
    if director[0].blank? or director[0].nil? or director[0].empty?  #case of sad path
      return nil
    else  
      self.where(director: director[0]).pluck(:title)
   end
  end
end
