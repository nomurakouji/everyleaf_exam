class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスク作成しました!"
    else
      render :new
    end
  end

  def index
    @tasks = Task.page(params[:page])
    if params[:sort_expired]
      @task = Task.all.order(deadline: :desc)

    elsif params[:sort_priority]
      @task = Task.all.order(priority: :asc)
    

    elsif params[:name].present?
      if params[:condition].present?
        @task = Task.all.task_name_search(params[:name]).condition_search(params[:condition])
      else
        @task = Task.all.task_name_search(params[:name])
      end
    elsif params[:condition].present?
      @task = Task.all.condition_search(params[:condition])
    else 
      @task = Task.all.order(condition: :desc)
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
    params.require(:task).permit(:name, :content, :deadline, :condition, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
