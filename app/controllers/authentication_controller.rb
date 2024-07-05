class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @recruiter = Recruiter.find_by(email: login_params[:email])
    if @recruiter&.authenticate(login_params[:password])
      token = JsonWebToken.encode({user_id: @recruiter.id})
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @recruiter.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
