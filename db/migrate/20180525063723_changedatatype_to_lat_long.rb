class ChangedatatypeToLatLong < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :latitude
    remove_column :properties, :longitude
    add_column :properties, :latitude, :float
    add_column :properties, :longitude, :float
  end
end
