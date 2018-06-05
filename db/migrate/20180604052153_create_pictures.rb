class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :image
      t.integer :pictureable_id
      t.string :pictureable_type
      t.timestamps
    end
  end
end
