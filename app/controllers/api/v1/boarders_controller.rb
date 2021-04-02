class Api::V1::BoardersController < ApplicationController
  # swagger_controller :boarders, "Boarder Management"

  def index
    branch = Branch.find(params[:branch_id])
    @boarders = branch.boarders
    json_response(@boarders)
  end

  def show
    branch = Branch.find(params[:branch_id])
    @boarder = Boarder.find(params[:id])
    if @boarder.branch_id == branch.id
      json_response(@boarder)
    end
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
    params.permit(:name, :kind, :breed, :gender, :age, :description, :branch_id)
  end
end
