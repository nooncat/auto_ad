# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  contact    :string(255)
#  content    :text
#  checkf     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ActiveRecord::Base
  attr_accessible :checkf, :contact, :content, :name
  validates :name, presence: true, length: { minimum: 3, maximum: 45 }
  validates :contact, presence: true, length: { minimum: 6, maximum: 45 }
  validates :content, presence: true, length: { minimum: 10, maximum: 1000 }
  default_scope order: 'feedbacks.created_at DESC'
end
