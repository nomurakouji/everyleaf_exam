class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "ブログ作成しました!"
    else
      render :new
    end
  end

  def index
    if params[:name].present?
      @tasks = Task.where('name LIKE ?', "%#{params[:name]}%")
    else
      @tasks = Task.all
    end
    if params[:condition].present?
      @tasks = Task.where(condition: params[:condition])
    end
    if params[:sort_expired].present?
      @tasks = Task.all.order(deadline: "DESC")
    end
    
  end

  def show
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
    params.require(:task).permit(:name, :content, :deadline, :condition)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
