class User < ApplicationRecord
  attr_accessor :old_password
  has_secure_password validations: false


  validate :password_presence
  validate :correct_old_password, on: :update, if: -> { password.present? }
  validates :password, confirmation: true, allow_blank: true,
            length: {minimum:6, maximum:70}
  validate :password_complexity

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Введена некорректная электронная почта'}
  # validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :username, presence: true, uniqueness: true

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

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorrect'
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])/

    errors.add :password, 'complexity requirement not met. Length should be 6-70 characters and include: 1 uppercase, 
                                                                                            1 lowercase and 1 digit'
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
end
