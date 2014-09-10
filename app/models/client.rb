# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  phone       :string(255)
#  information :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Client < ActiveRecord::Base
  attr_accessible :information, :name, :phone
  validates :name, presence: true, length: { minimum: 3, maximum: 35 }
  validates :phone, presence: true, length: { minimum: 6, maximum: 15 }
  validates :information, length: { maximum: 1500 }
end
