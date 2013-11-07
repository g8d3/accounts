require 'spec_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  it { should_not allow_value("blah").for(:email) }
  it { should_not allow_value("test@test").for(:email) }
  it { should allow_value("a@b.com").for(:email) }

  it { should validate_presence_of :password }

  it 'should not be valid when password does not match confirmation' do
    User.new(name: 'qwe', email: 'qwe@qwe.com', password: '123',
             password_confirmation: 'qwe').should_not be_valid
  end
end
