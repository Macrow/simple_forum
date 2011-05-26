class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => :index
  end

end

