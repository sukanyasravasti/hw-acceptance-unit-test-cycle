class AddDirectorToMovies < ActiveRecord::Migration
  def change
    #will add director column to existing movies table
    add_column :movies, :director, :string
  end
end
