class User < ApplicationRecord
  #include UsersValidator
  before_save :encrypt_password
  after_save :clear_password
  #attr_accessor :password

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..100 }
  validates :email, :presence => true, :uniqueness => true
  validates_email_format_of :email, :message => 'Please enter a valid email'
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_length_of :password, :in => 6..100, :on => :create
  validates_with UsersValidator

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_password
    self.password = nil
  end
end
