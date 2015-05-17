class CreateCommentsIncidents < ActiveRecord::Migration
  def change
    create_table :comments_incidents do |t|
      t.text :description,                  null: false
      t.references :user,     index: true,  null: false
      t.references :incident, index: true,  null: false

      t.timestamps null: false
    end
    add_foreign_key :comments_incidents, :users
    add_foreign_key :comments_incidents, :incidents
  end
end
