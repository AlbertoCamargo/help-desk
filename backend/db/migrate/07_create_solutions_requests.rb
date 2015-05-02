class CreateSolutionsRequests < ActiveRecord::Migration
  def change
    create_table :solutions_requests do |t|
      t.text :description,    null: false
      t.references :user,     null: false,  index: true
      t.references :request,  null: false,  index: true

      t.timestamps null: false
    end
    add_foreign_key :solutions_requests, :users
    add_foreign_key :solutions_requests, :requests
  end
end
