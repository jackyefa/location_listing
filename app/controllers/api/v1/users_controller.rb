class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!


  def profile
    property_count = @current_user.properties.count
    render json: { success: true, data: @current_user.attributes.merge( :property_count => property_count )}, status: 200
  end

  def update
    if @current_user.update_attributes(name: params[:name], phone: params[:phone], address: params[:address], city: params[:city], state: params[:state], zipcode: params[:zipcode])
      render_success
    else   
      render_with_errors(@current_user.errors.full_messages.join(','))
    end
  end
end
