# == Schema Information
#
# Table name: cars
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  yearofrelease :string(255)
#  price         :string(255)
#  describtion   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Car < ActiveRecord::Base
  attr_accessible :name, :describtion, :price, :yearofrelease
  has_many :photos, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 30 }
  validates :yearofrelease, presence: true, length: { maximum: 15 }
  validates :price, presence: true, length: { maximum: 15 }
  validates :describtion, presence: true, length: { maximum: 1500 }
end
