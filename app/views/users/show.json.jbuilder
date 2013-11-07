json.extract! @user, :id, :name, :email, :password
json.authentication_token @user.id
