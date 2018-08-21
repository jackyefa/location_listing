class ChangeUnitDatatypeInProperty < ActiveRecord::Migration[5.1]
  def change
    change_column :properties, :unit, :string
  end
end
