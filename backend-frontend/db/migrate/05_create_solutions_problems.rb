class CreateSolutionsProblems < ActiveRecord::Migration
  def change
    create_table :solutions_problems do |t|
      t.text :description,   null: false
      t.references :user,    null: false,  index: true
      t.references :problem, null: false,  index: true

      t.timestamps null: false
    end
    add_foreign_key :solutions_problems, :users
    add_foreign_key :solutions_problems, :problems
  end
end
