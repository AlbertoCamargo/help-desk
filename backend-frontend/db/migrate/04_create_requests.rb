class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title,     null: false
      t.text :description, null: false
      t.string :file
      t.references :user,  null: false,  index: true

      t.timestamps null: false
    end
    add_foreign_key :requests, :users
  end
end
