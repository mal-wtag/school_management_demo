class Login < ApplicationRecord
  before_save{ self.email=email.downcase }
  belongs_to :user
  validates :password, presence: true, length:{ minimum:6 }
  validates :email, presence: true, uniqueness:{ case_sensitive:false }
  has_secure_password
end
