class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :category
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :photo
      t.string :buy_link
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
