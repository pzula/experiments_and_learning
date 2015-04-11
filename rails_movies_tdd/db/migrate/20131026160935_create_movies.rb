class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.decimal :total_gross
      t.string :description
      t.date :released_on

      t.timestamps
    end
  end
end
