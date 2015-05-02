class SolutionsRequest < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :request

  validates :description, :user_id, :request_id, presence: true
end
