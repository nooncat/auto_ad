# == Schema Information
#
# Table name: photos
#
#  id              :integer          not null, primary key
#  image           :string(255)
#  attachable_id   :integer
#  attachable_type :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Photo < ActiveRecord::Base
  attr_accessible :image, :image_cache

  belongs_to :attachable, :polymorphic => true

  mount_uploader :image, ImageUploader
end
