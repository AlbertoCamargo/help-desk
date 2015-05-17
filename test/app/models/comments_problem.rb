class CommentsProblem < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  validates :description, :user_id, :problem_id, presence: true
end
