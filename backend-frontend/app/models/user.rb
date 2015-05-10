class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  has_many :problems,  dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :requests,  dependent: :destroy
  has_many :comments_problems,   dependent: :delete_all
  has_many :comments_incidents,  dependent: :delete_all
  has_many :comments_requests,   dependent: :delete_all

  validates :customer_id, :email, :full_name, :phone, :rank, :password, :password_confirmation, presence: true
  validates :customer_id, :email, uniqueness: true
  validates :customer_id, :phone, numericality: { only_integer: true }
  validates :password, confirmation: true 

  before_save :format_attributes

  def is_customer?
    self.rank == 'usuario' ? true : false
  end

  def is_admin?
    self.rank == 'administrador' ? true : false
  end

  def is_sa?
    self.rank == 'sa' ? true : false
  end

  def creator_cases?(id, type)
    if (type == 'request')
      self.requests.where(id: id).first ? true : false
    elsif (type == 'problem')
      self.problems.where(id: id).first ? true : false
    else
      self.incidents.where(id: id).first ? true : false
    end      
  end

  def creator_comments?(id, type)
    if (type == 'request')
      self.comments_requests.where(id: id).first ? true : false
    elsif (type == 'problem')
      self.comments_problems.where(id: id).first ? true : false
    else
      self.comments_incidents..where(id: id).first ? true : false
    end      
  end

  private
  def format_attributes
    self.email.downcase!
    self.full_name.downcase!
  end
end
