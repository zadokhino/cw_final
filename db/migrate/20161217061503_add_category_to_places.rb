class AddCategoryToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :category, foreign_key: true
  end
end
