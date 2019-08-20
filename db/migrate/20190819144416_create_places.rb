class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.text :details
      t.string :category
      t.string :address
      t.string :photo

      t.timestamps
    end
  end
end
