class Admin::UsersController < ApplicationController
  before_action :admin_user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to admin_user_path(@user.id)
    # else
    #   render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @tasks = Task.all.includes(:user)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path, notice: "ユーザーを編集しました!"
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
    unless current_user.admin?
      flash[:danger] = '管理者以外はアクセスできません'
      redirect_to(root_path) 
    end
  end
end
