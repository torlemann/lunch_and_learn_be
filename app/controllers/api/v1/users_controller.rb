class Api::V1::UsersController < ApplicationController 
    def create 
      user_params[:email] = user_params[:email].downcase
      user = User.new(user_params)
  
      if User.find_by(email: user[:email]).present?
        render json: { status: 400, message: "Email is associated with another account." }
      else 
        user.save 
        render json:(UserSerializer.new(user)), status: :created
      end
    end
  
    private 
    def user_params 
      params.permit(:email, :name)
    end
  end