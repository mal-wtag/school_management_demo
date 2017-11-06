class User < ApplicationRecord
  has_one :login
  validates :name,presence:true,length:{maximum:50}
  validates :phone,presence:true
  validates :address,presence:true
  validates :roll,presence:true,uniqueness: true
  accepts_nested_attributes_for :login
end
