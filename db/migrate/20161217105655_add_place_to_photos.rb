class AddPlaceToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :place, foreign_key: true
  end
end
