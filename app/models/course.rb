class Course < ApplicationRecord
  validates :name,presence:true
  validates :credit,presence:true,numericality: {only_integer: true}
end
