class Problem < ActiveRecord::Base

  belongs_to :user
  has_many :comments_problems,  dependent: :delete_all

  validates :title, :description, :user_id, presence: true

  def is_finished?
    self.state == 'answered' ? true : false
  end
end
