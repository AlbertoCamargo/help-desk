class CreateSolutionsIncidents < ActiveRecord::Migration
  def change
    create_table :solutions_incidents do |t|
      t.text :description,     null: false
      t.references :user,      null: false,  index: true
      t.references :incident,  null: false,  index: true

      t.timestamps null: false
    end
    add_foreign_key :solutions_incidents, :users
    add_foreign_key :solutions_incidents, :incidents
  end
end
