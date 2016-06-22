class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_presence_of :firstname, :lastname

  def full_name
    "#{firstname} #{lastname}"
  end

end
