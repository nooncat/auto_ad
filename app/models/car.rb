# == Schema Information
#
# Table name: cars
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  year_of_release :string(255)
#  price           :string(255)
#  describtion     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  body_type       :string(255)
#  engine          :string(255)
#  engine_type     :string(255)
#  transmission    :string(255)
#  color           :string(255)
#  mileage         :string(255)
#  model           :string(255)
#
# Indexes
#
#  index_cars_on_created_at  (created_at)
#

class Car < ActiveRecord::Base
  attr_accessible :name, :describtion, :price, :year_of_release, :body_type, :engine, :engine_type, :transmission, :color, :mileage, :model, :photos_attributes
  has_many :photos, dependent: :destroy, :as => :attachable  
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: lambda { |a| a[:image].blank? && a['image_cache'].blank? }

  
  validates :name, presence: true
  validates :year_of_release, presence: true
  VALID_PRICE_REGEX = /^[0-9]+$/
  validates :price, presence: true, length: { maximum: 12 }, format: { with: VALID_PRICE_REGEX }
  validates :describtion, presence: true, length: { maximum: 1500 }
  validates :photos, length: { maximum: 25, too_long: 'too much' }
  validates :body_type, presence: true
  validates :engine, presence: true
  validates :engine_type, presence: true
  validates :transmission, presence: true
  validates :color, presence: true
  validates :mileage, presence: true
  validates :model, presence: true, length: { maximum: 20 }
  default_scope order: 'cars.created_at DESC'
end
