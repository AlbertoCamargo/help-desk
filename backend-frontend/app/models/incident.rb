class Incident < ActiveRecord::Base
  
  # Associations
  belongs_to :user
  has_many :comments_incidents,  dependent: :delete_all

  # Validations
  validates :title, :description, :user_id, presence: true

  # Methods
  def is_finished?
    self.state == 'answered' ? true : false
  end
end
