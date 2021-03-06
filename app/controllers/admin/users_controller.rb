class Admin::UsersController < ApplicationController

  before_filter :restrict_access
  before_filter :require_admin

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    UserMailer.deletion_email(@user).deliver_now
    redirect_to '/admin/users'
  end
end
