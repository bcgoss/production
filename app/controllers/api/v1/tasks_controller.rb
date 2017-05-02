class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  def create
    @task = List.find(params[:list_id]).tasks.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: { message: @task.errors.full_messages.join('. ') }, status: :error
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      render json: @task
    else
      render json: { message: @task.errors.full_messages.join('. ') }, status: :error
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      render status: :destroyed
    else
      render json: { message: @task.errors.full_messages.join('. ') }, status: error
    end
  end
  private
    def task_params
      params.require(:task).permit(:name, :description, :estimate, :completed)
    end
end
