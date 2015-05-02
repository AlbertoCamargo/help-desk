class Incident < ActiveRecord::Base
  
  belongs_to :user
  has_many :solutions_incidents, dependent: :delete_all

  validates :title, :description, :user_id, presence: true
end
