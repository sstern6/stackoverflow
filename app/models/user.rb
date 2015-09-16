require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  validates :username, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\w*@\w*(.com|.net|.org)/
  validates :password_hash, presence: true 

  has_many :comments
  has_many :questions
  has_many :answers
  has_many :votes
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
  	self.password == password
  end
end
