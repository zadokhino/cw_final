class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.float :bar
      t.float :service
      t.float :atmosphere

      t.timestamps
    end
  end
end
