class Problem < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :comments_problems,  dependent: :delete_all

  # Validations
  validates :title, :description, :user_id, presence: true

  # Methods
  def is_finished?
    self.state == 'answered' ? true : false
  end

  def has_one_comment?
    self.comments_problems.count == 1 ? true : false
  end
end
