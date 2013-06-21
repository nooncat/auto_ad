class Car < ActiveRecord::Base
  attr_accessible :name, :describtion, :price, :year_of_release, :body_type, :engine, :engine_type, :transmission, :color, :mileage, :model, :photos_attributes
  has_many :photos, dependent: :destroy, :as => :attachable  
  accepts_nested_attributes_for :photos, allow_destroy: true, :reject_if => lambda { |a| a[:image].blank? }

  
  validates :name, presence: true, length: { maximum: 30 }
  validates :year_of_release, presence: true, length: { maximum: 15 }
  validates :price, presence: true, length: { maximum: 15 }
  validates :describtion, presence: true, length: { maximum: 1500 }

  default_scope order: 'cars.created_at DESC'
end

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
#  body_type     :string(255)
#  engine        :string(255)
#  engine_type   :string(255)
#  transmission  :string(255)
#  color         :string(255)
#  mileage       :string(255)
#  model         :string(255)
#

