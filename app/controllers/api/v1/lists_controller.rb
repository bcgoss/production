class Api::V1::ListsController < ApplicationController
  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list, status: :created
    else
      render json: {message: @list.errors.full_messages.join(', ')}, status: :error
    end
  end

  def show
    @list = List.find(params[:id])
    render json: @list
  end

  def index
    @lists = List.all
    render json: @lists
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      render json: @list, status: :updated
    else
      render json: { message: @list.errors.full_messages.join(". ") }, status: :error
    end
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end
