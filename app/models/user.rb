require 'securerandom'

class User < ActiveRecord::Base
  attr_accessor :password_confirmation, :authentication_token
  validates_presence_of :name, :email, :password
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validate do
    if password != password_confirmation
      errors[:password] << 'Passwords do not match.'
    end
  end

  before_create :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token = SecureRandom.hex
  end
end
