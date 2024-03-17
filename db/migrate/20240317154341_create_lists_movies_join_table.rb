class CreateListsMoviesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :lists_movies, id: false do |t|
      t.references :list, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
    add_index :lists_movies, [:list_id, :movie_id], unique: true, name: 'index_lists_movies_on_list_id_and_movie_id'
 end
end
