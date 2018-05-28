class AddAddressToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    change_column :users, :phone, :string
  end
end
