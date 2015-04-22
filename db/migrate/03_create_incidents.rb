class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :title,      null: false
      t.text :description,  null: false
      t.string :file
      t.references :user,   null: false,  index: true

      t.timestamps null: false
    end
    add_foreign_key :incidents, :users
  end
end
