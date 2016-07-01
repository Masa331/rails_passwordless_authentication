class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :login_token
      t.datetime :login_token_valid_until

      t.timestamps
    end
  end
end
