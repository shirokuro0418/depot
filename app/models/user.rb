class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  after_destroy :ensure_an_admin_remains

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
