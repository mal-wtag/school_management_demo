class User < ApplicationRecord
  before_save { self.email=email.downcase }
  # attr_accessor   :password, :password_confirmation
  has_and_belongs_to_many :roles
  # accepts_nested_attributes_for :roles, allow_destroy: true, reject_if: :all_blank
  validates :name,presence:true,length: { maximum:50 }
  validates :phone,presence:true
  validates :address,presence:true

  validates :password, presence: true, length: { minimum:6 }, if: :password_changed?
  validates :email, presence: true, uniqueness: { case_sensitive:false }

  has_secure_password

  private
    def password_changed?
      !self.password.blank?
    end
end
