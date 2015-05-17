class CreateCommentsRequests < ActiveRecord::Migration
  def change
    create_table :comments_requests do |t|
      t.text :description,                null: false
      t.references :user,    index: true, null: false
      t.references :request, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :comments_requests, :users
    add_foreign_key :comments_requests, :requests
  end
end
