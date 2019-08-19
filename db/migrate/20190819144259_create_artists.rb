class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :category
      t.string :photo
      t.string :spotify_link

      t.timestamps
    end
  end
end
