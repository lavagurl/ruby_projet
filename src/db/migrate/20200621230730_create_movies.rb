class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :producer
      t.text :description
      t.date :release_date
      t.boolean :status
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
