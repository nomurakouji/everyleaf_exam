class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    @user = User.new
    # if logged_in?
    #   redirect_to tasks_path  
    # end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else 
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @tasks = @user.tasks
    if @user.id == @current_user.id
      render "show"
    elsif logged_in?
      @user = User.find(params[:id])
    else
      redirect_to tasks_path
    end
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザーを編集しました!"
    else
      render :edit
    end
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
  def user_params
    params.require(:user).permit(:namae, :email, :password, :password_confirmation)
  end
end
