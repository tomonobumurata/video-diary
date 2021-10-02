class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string     :title,    null: false
      t.date       :date
      t.integer    :genre_id, null: false
      t.integer    :star_id,  null: false
      t.integer    :place_id
      t.text       :impression
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
