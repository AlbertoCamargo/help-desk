class Request < ActiveRecord::Base
 
  belongs_to :user
  has_many :solutions_requests, dependent: :delete_all
  has_many :comments_requests,  dependent: :delete_all

  validates :title, :description, :user_id, presence: true
end
