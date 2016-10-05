class User < ActiveRecord::Base


  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}

  has_secure_password

  after_save :default_admin_to_false

  def default_admin_to_false
    self.is_admin = false
  end
end
