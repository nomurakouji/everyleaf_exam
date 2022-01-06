class Admin::UsersController < ApplicationController
  before_action :admin_user
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.order("created_at DESC")
  end
  
  def edit
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "ユーザーを削除しました" }
      format.json { head :no_content }
    end
  end
  private
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
