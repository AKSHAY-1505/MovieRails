class CreateMovieLists < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_lists do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
