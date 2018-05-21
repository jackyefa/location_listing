class Api::V1::SessionsController <  Api::V1::BaseController
  before_action :authentication_token, only: [:sign_out, :update_password]
  before_action :find_user, only: [:sign_in, :forgot_password]

  def sign_in
    invalid_email_or_password and return unless @user.present?
    invalid_email_or_password and return unless @user.authenticate(params[:password])
    @user.regenerate_auth_token
    response.headers["X-AUTH-TOKEN"] = @user.auth_token  
  end

  def sign_up
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      response.headers["X-AUTH-TOKEN"] = @user.auth_token   
    else
      render_with_errors(user.errors.full_messages.join(','))
    end
  end

  def sign_out
    invalid_token_error and return unless @user.present?
    if @user.update_attributes(auth_token: nil)
      render_success
    end    
  end

  def forgot_password
    render_with_errors("Invalid Email") and return unless @user.present?
    verification_code = VerificationCode.create(email: params[:email])
    render json: {success: true, verify_token: verification_code.verify_token}, status: 200
  end

  def reset_password
    verification_code = VerificationCode.find_by(verify_token: request.headers['verify-token'])
    invalid_token_error and return unless verification_code.present?
    user = User.find_by(email: verification_code.email)
    user.update_attributes(password: params[:password])
    verification_code.destroy
    render_success
  end

  def update_password
    invalid_token_error and return unless @user.present?
    render_with_errors("Invalid current password") and return unless @user.authenticate(params[:current_password])
    @user.update_attributes(password: params[:new_password])
    render_success
  end
end
