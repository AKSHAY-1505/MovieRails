class DropCoverFromMovies < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies , :cover
  end
end
