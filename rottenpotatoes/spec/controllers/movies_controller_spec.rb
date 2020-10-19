require 'rails_helper'

describe MoviesController do
  describe '#similar_movies' do
    context 'when a director is found' do
      it "should return a list of movies with the same director" do
        my_movie = double('Movie', :id => '1', :title => 'Alien', :director => 'Spielberg')
        expect(Movie).to receive(:find).with('1').and_return(my_movie)
        expect(my_movie.director).to eql 'Spielberg'
        expect(Movie).to receive(:find_movies_by_director).with('Spielberg')
        get :similar_movies, {:id => 1}
      end
    end

    context 'when a director is not found' do
      it "should redirect to the home page" do
        my_movie = double('Movie', :id => '1', :title => 'Alien', :director => nil)
        expect(Movie).to receive(:find).with('1').and_return(my_movie)
        get :similar_movies, {:id => "1"}
        expect(flash[:notice]).to match(/'Alien' has no director info/)
        expect(response).to redirect_to(movies_path)
      end
    end
  end

end