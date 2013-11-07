require 'spec_helper'

describe 'sign up/in requests' do

  let(:valid_user) do
    {
      user: {
        name: 'some',
        email: 'some@asd.com',
        password: '123123123',
        password_confirmation: '123123123'
      }
    }
  end

  it 'allows user to sign up and sign in sending JSON data' do
    post users_path(:json), valid_user

    user_attrs = JSON.parse response.body

    %w(id name email).each do |attr|
      user_attrs.should have_key attr
      user_attrs[attr].should == User.last.send(attr)
    end

    user_attrs.should have_key "authentication_token"

    response.status.should == 201
  end
end
