class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  has_many :problems,  dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :requests,  dependent: :destroy
  has_many :solutions_problems,  dependent: :delete_all
  has_many :solutions_incidents, dependent: :delete_all
  has_many :solutions_requests,  dependent: :delete_all

  validates :customer_id, :email, :full_name, :phone, :rank, :password, :password_confirmation, presence: true
  validates :customer_id, :email, uniqueness: true
  validates :customer_id, :phone, numericality: { only_integer: true }
  validates :password, confirmation: true 

  before_save :format_attributes

  def is_customer?
    self.first_time == 'usuario' ? true : false
  end

  def is_admin?
    self.first_time == 'administrador' ? true : false
  end

  def is_sa?
    self.first_time == 'sa' ? true : false
  end

  private
  def format_attributes
    self.email.downcase!
    self.full_name.downcase!
  end
end
