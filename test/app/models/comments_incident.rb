class CommentsIncident < ActiveRecord::Base
  belongs_to :user
  belongs_to :incident

  validates :description, :user_id, :incident_id, presence: true
end
