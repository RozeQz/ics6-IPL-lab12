class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def formatted_created_at
    created_at.strftime("%d.%m.%Y %H:%M:%S")
  end
end
