class CreateCommentsProblems < ActiveRecord::Migration
  def change
    create_table :comments_problems do |t|
      t.text :description,                   null: false
      t.references :user,    index: true,    null: false
      t.references :problem, index: true,    null: false

      t.timestamps null: false
    end
    add_foreign_key :comments_problems, :users
    add_foreign_key :comments_problems, :problems
  end
end
