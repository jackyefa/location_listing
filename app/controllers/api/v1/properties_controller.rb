class Api::V1::PropertiesController <  Api::V1::BaseController
  before_action :authenticate_user!

  def index   
    
    @properties = Property.all_except(@current_user)
    @user_properties = @current_user.properties
  end

  def create
    @property = @current_user.properties.build(property_params)
    if @property.save    
      if params[:property][:image].present?
        decoded_file = decode_base64_image(params[:property][:image].gsub(/\\n/, "\n").gsub(/\\t/, "\t").gsub(/\\r/, "\r"))
        picture = @property.pictures.create(image: decoded_file)
        render json: {success: true, id: @property.id}, status: 200 and return
      end
      render json: {success: true, id: @property.id}, status: 200
    else
      render_with_errors(@property.errors.full_messages.join(','))
    end
  end

  
  private
    def property_params
      params.require(:property).permit(:address, :city, :state, :zipcode, :unit, :id_number, :property_type, :latitude, :longitude)
    end

    def decode_base64_image encoded_file
      decoded_file = Base64.decode64(encoded_file)
      file = Tempfile.new(['image','.jpg'])
      file.binmode
      file.write decoded_file
      file
    end
end


