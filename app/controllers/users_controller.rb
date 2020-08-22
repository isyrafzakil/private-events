class UsersController < ApplicationController
include UsersHelper

  before_action :authenticate_user!
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.save 

  	flash.notice = "Dah buat user geng!"
  	redirect_to user_path(@user)

  end

  def show
  	@user = User.find(params[:id])
  	@events = @user.created_events
  end

  def index
  	@users = User.all
  end

end
