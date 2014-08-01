# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  login           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :login, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.login = login.downcase }
  before_save :create_remember_token

  validates :login, presence: true, length: { maximum: 50 },
                uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
