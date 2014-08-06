class Client < ActiveRecord::Base
  attr_accessible :information, :name, :phone
  validates :name, presence: true, length: { minimum: 3, maximum: 45 }
  validates :phone, presence: true, length: { minimum: 6, maximum: 15 }
  validates :information, length: { maximum: 1500 }
end
