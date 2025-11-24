class Api::V1::AuthController < ApplicationController

  def login
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)

    if user && user.authenticate(password)

      token = JwtServices.encode({user: user.id, email: user.email}, 24.hours.from_now)
      render json: { user: user, token: token }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end

  end

  def register
    email = params[:email]
    password = params[:password]
    nome = params[:nome]

    user = User.create(email:email, password: password, nome: nome)

    puts user.inspect
    token = JwtServices.encode({user: user.id, email: user.email}, 24.hours.from_now)

    render json: {user:user, token: token}, status: :created if user.save
  end
end
