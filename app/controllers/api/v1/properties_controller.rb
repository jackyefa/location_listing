class Api::V1::PropertiesController <  Api::V1::BaseController
  before_action :authenticate_user!

  def index 
    @properties = Property.all_except(@current_user)
    @user_properties = @current_user.properties
  end

  def create
    @property = @current_user.properties.build(property_params)
    if @property.save
      render_success
    else
      render_with_errors(@property.errors.full_messages.join(','))
    end
  end
  
  private
    def property_params
      params.require(:property).permit(:address, :city, :state, :zipcode, :unit, :id_number, :property_type, :latitude, :longitude)
    end
end