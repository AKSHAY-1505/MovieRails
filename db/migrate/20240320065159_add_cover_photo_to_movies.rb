class AddCoverPhotoToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :cover_photo, :string
  end
end
