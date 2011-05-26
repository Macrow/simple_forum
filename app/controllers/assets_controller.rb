class AssetsController < ApplicationController
  layout :false
  def new
    @user = current_user
    @asset = Asset.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = current_user
    @asset = @user.assets.build(params[:asset])
    respond_to do |format|
      if @asset.save
        format.html # Hacked, put javascript in erb.
      else
        format.html
        format.js
      end
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    respond_to do |format|
      format.js
    end
  end
end

