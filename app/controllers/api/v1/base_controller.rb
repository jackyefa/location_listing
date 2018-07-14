class Api::V1::BaseController < ApplicationController

  def authenticate_user!
    @current_user = User.find_by(auth_token: request.headers['X-AUTH-TOKEN'])
    invalid_token_error and return unless @current_user.present?
  end

  def find_user
    @user = User.find_by(email: params[:email])
  end

  def render_success
    render json: { success: true}, status: 200
  end

  def invalid_token_error
    render json: { success: false, error: "Invalid Token" }, status: 401
  end

  def invalid_email_or_password
    render json: {success: false, error: "Invalid Email or Password"}, status: 422
  end

  def render_with_errors(error)
    render json: { success: false, error: error }, status: 422
  end
end