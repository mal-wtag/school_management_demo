class User < ApplicationRecord
  before_save{ self.email=email.downcase }

  validates :name,presence:true,length:{maximum:50}
  validates :phone,presence:true
  validates :address,presence:true

  validates :password, presence: true, length:{ minimum:6 }
  validates :email, presence: true, uniqueness:{ case_sensitive:false }

  has_secure_password

end
