class UsersController < ApplicationController

  # def index
  #   users = User.all
  #   render json: {
  #     users
  #   }
    # render json: {
    #   'hello': 'hi'
    # }
  # end

  def show
    user = User.find_by(name: params[:name])
    user != nil ? (render json: UserSerializer.new(user).to_serialized_json) : (raise 'error')
  end

  def create
    user = User.create(name: params[:name])
    render json: UserSerializer.new(user).to_serialized_json
  end
  
end
