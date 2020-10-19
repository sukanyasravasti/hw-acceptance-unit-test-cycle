require 'rails_helper'


describe Movie do
  describe '.find_similar_movies' do
    let!(:movie1) { FactoryBot.create(:movie, :title => 'Avatar', director: 'James Cameron') }
    let!(:movie2) { FactoryBot.create(:movie, :title => 'Before Sunset', director: 'Richard Linklater') }
    let!(:movie3) { FactoryBot.create(:movie, :title => "Titanic", director: 'James Cameron') }
    let!(:movie4) { FactoryBot.create(:movie, :title => "No Director") }

    context 'director exists' do
      it 'finds similar movies' do
        expect(Movie.similar_movies(movie1.title)).to eql(['Avatar', "Titanic"])
        expect(Movie.similar_movies(movie1.title)).to_not include(['Before Sunset'])
        expect(Movie.similar_movies(movie2.title)).to eql(['Before Sunset'])
      end
    end

    context 'director does not exist' do
      it 'sad path' do
        expect(Movie.similar_movies(movie4.title)).to eql(nil)
      end
    end
  end

end