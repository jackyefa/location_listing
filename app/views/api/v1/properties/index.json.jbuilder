json.all_properties @all_properties do |all_propertie|  
  # json.(all_propertie, :id, :address, :city, :state, :zipcode, :latitude, :longitude, :unit, :id_number, :property_type, :building_name, :country)
  # json.image all_propertie.pictures.last.present? ? "#{request.host}#{all_propertie.pictures.last.image.url}" : "" 
end

json.user_properties @user_properties do |user_propertie|  
  json.(user_propertie, :id, :address, :city, :state, :zipcode, :latitude, :longitude, :unit, :id_number, :property_type, :building_name, :country)
  json.image user_propertie.pictures.last.present? ? "#{request.host}#{user_propertie.pictures.last.image.url}" : "" 
end