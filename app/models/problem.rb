class Problem < ActiveRecord::Base

  belongs_to :user
  has_many :solutions_problems, dependent: :delete_all

  validates :title, :description, :user_id, presence: true
end
