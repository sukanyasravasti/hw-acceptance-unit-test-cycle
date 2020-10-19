class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  #define method to find movie with same director
  def self.find_movies_by_director(director_name)
    self.where(director: director_name)
  end
end
