require 'rails_helper'

describe MoviesController do
  describe 'Search movies by same director' do
    it 'should call Movie.similar_movies' do
      expect(Movie).to receive(:similar_movies).with('Aladdin')
      get :search, { title: 'Aladdin' }
    end

    it 'should assign similar movies if director exists' do
      Movie.stub(:similar_movies).with('Lady Bird').and_return(['Lady Bird', 'Little Women']) #with() is the given input, i.e when similar_movies is called with input Lady Bird
      get :search, {title: 'Lady Bird'} #without this search method tet similar_movies would never be called
      expect(assigns(:similar_movies)).to eql(['Lady Bird', 'Little Women'])
    end
    
    it "should redirect to home page if director isn't known" do
      Movie.stub(:similar_movies).with('No Director').and_return(nil)
       get :search, {title: 'No Director'}
       expect(response).to redirect_to(movies_path)
     end
  end
end
