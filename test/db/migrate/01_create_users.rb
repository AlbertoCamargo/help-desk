class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :customer_id,      null: false
      t.string :full_name,         null: false
      t.string :email
      t.string :phone
      t.string :image
      t.string :rank,              null: false
      t.boolean :first_time,       default: true
      t.string :crypted_password,  null: false
      t.string :salt,              null: false

      t.timestamps

      # Remember me
      t.string :remember_me_token
      t.datetime :remember_me_token_expires_at

      # Reset password
      t.string :reset_password_token
      t.datetime :reset_password_token_expires_at
      t.datetime :reset_password_email_sent_at
    end

    add_index :users, :customer_id, unique: true
    add_index :users, :remember_me_token
    add_index :users, :reset_password_token
  end
end