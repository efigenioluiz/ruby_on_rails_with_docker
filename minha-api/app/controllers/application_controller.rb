class ApplicationController < ActionController::API

  before_action :authenticate_user!, except: [:login, :register]
  attr_reader :current_user

  private

  def authenticate_user!
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last if auth_header
    # "dasdasda.dasdasdsa.dadsa"

    # {
    # "user": 1,
    # "batata": 123,
    # "exp": 1763394170
    # }
    begin
      decoded_token =  JwtServices.decode(token)
      user_id = decoded_token[:user]
      @current_user =  User.find(user_id)

    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
