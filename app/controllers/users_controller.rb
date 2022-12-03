class UsersController < ApplicationController

  def show
    @user = User.find_or_create_by(address: params[:id])
    render json: @user
  end

  def update_user
    @user = User.find_or_create_by(address: params[:address])
    @user.verified = true
    @user.save
    render json: @user
  end
end
