json.user do 
  json.extract! @user, :id, :name, :email, :phone
end