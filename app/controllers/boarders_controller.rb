class BoardersController < ApplicationController
  def index
    @boarders = Boarder.all
    json_response(@boarders)
  end

  def show
    @boarder = Boarder.find(params[:id])
    json_response(@boarder)
  end

  def create
    @boarder = Boarder.create!(boarder_params)
    json_response(@boarder, :created)
  end

  def update
    @boarder = Boarder.find(params[:id])
    @boarder.update!(boarder_params)
    json_response(@boarder, :accepted)
  end

  def destroy
    @boarder = Boarder.find(params[:id])
    if @boarder.destroy!
      render status: 200, json: {
       message: "Delete successful!"
       }
    end
  end

  private
  def boarder_params
    params.permit(:name, :kind, :breed, :gender, :age, :description)
  end
end
