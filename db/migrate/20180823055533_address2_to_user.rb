class Address2ToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_2, :string
  end
end
