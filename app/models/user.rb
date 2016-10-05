class User < ActiveRecord::Base
  has_secure_password

  after_save :default_admin_to_false

  def default_admin_to_false
    self.is_admin = false
  end
end
