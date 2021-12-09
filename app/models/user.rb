class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Введена некорректная электронная почта'}
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def formatted_created_at
    created_at.strftime("%d.%m.%Y %T %Z")
  end

  def formated_last_login_at
    last_login_at.strftime("%d.%m.%Y %T %Z")
  end

  def update_last_login_at
    self.last_login_at = DateTime.now.strftime("%d.%m.%Y %T %Z")
    save
  end
end
