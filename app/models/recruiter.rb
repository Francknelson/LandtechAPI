class Recruiter < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :password,
            presence: true,
            length: { in: 6..20 }
end
