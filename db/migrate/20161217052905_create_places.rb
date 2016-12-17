class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.string :main_photo
      
      t.timestamps
    end
  end
end
