class User < ActiveRecord::Base
  has_many :recipes
  has_many :menus
  has_many :menu_items, through: :menus


  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}

  has_secure_password

  after_save :default_admin_to_false

  def default_admin_to_false
    if self.is_admin == nil
      self.is_admin = false
    elsif self.is_admin == false
      self.is_admin = false
    else
      self.is_admin = true
    end
  end

end
