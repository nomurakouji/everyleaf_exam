class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:destroy]
  

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to tasks_path, notice: "タスク作成しました!"
    else
      render :new
    end
  end

  def index
    @tasks = Task.page(params[:page]).per(7)
    if params[:sort_expired]
      @task = current_user.tasks.order(deadline: :desc).page(params[:page]).per(7)
    elsif params[:sort_priority]
      @task = current_user.tasks.order(priority: :asc).page(params[:page]).per(7)
    elsif params[:name].present?
      if params[:condition].present?
        @task = current_user.tasks.task_name_search(params[:name]).condition_search(params[:condition]).page(params[:page]).per(7)
      else
        @task = current_user.tasks.task_name_search(params[:name]).page(params[:page]).per(7)
      end
    elsif params[:condition].present?
      @task = current_user.tasks.condition_search(params[:condition]).page(params[:page]).per(7)
    else 
      @task = current_user.tasks.order(condition: :desc).page(params[:page]).per(7)
    end
    if current_user.admin?
      @task = Task.all.order(condition: :desc).page(params[:page]).per(7)
    end
  end

  def show
    @favorites = current_user.favorites.find_by(task.id: @task.id)
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました!"
  end

  private
  def task_params
    params.require(:task).permit(:name, :content, :deadline, :condition, :priority, { label_ids: [] })
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
