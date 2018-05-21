class CreateVerificationCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :verification_codes do |t|
      t.string :email
      t.string :verify_token
      t.timestamps
    end
  end
end
