require 'rails_helper'

describe Movie do
  context 'director exists' do
      it 'finds similar movies' do
        movie = double('Movie', :director => 'Spielberg')
        expect(Movie).to receive(:where).with(director: 'Spielberg')
        Movie.find_movies_by_director('Spielberg')
    end
  end
  
  context 'director does not exist' do
      it 'hits sad path' do
        movie = double('Movie', :director => nil)
        Movie.find_movies_by_director(nil)
      end
    end
end
  
