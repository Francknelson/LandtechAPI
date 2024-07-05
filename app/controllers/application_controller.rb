class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    decoded = JsonWebToken.decode(token)
    @current_recruiter = Recruiter.find_by(id: decoded[:recruiter_id]) if decoded

  rescue
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
