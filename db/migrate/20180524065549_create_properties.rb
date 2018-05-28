class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.integer :unit 
      t.string  :id_number
      t.string  :property_type
      t.string  :latitude
      t.string  :longitude
      t.integer :user_id
      t.timestamps
    end
  end
end
