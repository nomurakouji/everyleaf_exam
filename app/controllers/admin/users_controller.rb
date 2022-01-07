class Admin::UsersController < ApplicationController
  before_action :admin_user
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @task = Task.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザーを編集しました!"
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice:"ユーザーを削除しました"
  end

  private
  def admin_user
    @users = User.all
    redirect_to(root_path) unless current_user.admin?
  end
end
