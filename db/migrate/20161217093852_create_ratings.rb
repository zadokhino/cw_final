class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :bar
      t.integer :service
      t.integer :atmosphere
      t.text :review
      t.references :user
      t.references :place
      t.timestamps
    end
  end
end
