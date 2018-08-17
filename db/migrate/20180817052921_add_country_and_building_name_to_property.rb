class AddCountryAndBuildingNameToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :country, :string
    add_column :properties, :building_name, :string
  end
end
