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

  def uploadMetadata
    require 'rest_client'
    metadata = params["body"]
    File.open("public/metadata.json","w") do |f|
      f.write(metadata.to_json)
    end
   result = RestClient.post 'https://ipfs.infura.io:5001/api/v0/add?pin=true', {:file => File.open("public/metadata.json")}, {:"Authorization"=>"Basic MklQdGdxRlBLaGFOMDVzVVFDc1dUUzdmRUI4OmM0ZTFlYTgzYjE2YjkwZjE0MDY4MmFlYTYzYjQ2YTkw"}

   render json: result.body
  end

end
