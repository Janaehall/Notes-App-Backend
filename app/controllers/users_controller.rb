class UsersController < ApplicationController

  def show
    user = User.find_by(name: params[:name])
    user != nil ? (render json: UserSerializer.new(user).to_serialized_json) : (raise 'error')
  end

  def create
    user = User.create(name: params[:name])
    if user.valid?
      render json: UserSerializer.new(user).to_serialized_json

    else
      raise 'error'
    end
  end
  
end
