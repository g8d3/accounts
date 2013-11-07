class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  validates_presence_of :name, :email, :password
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validate do
    if password != password_confirmation
      errors[:password] << 'Passwords do not match.'
    end
  end
end
