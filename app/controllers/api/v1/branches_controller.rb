class Api::V1::BranchesController < ApplicationController
  def index
    @branches = Branch.all
    json_response(@branches)
  end

  def show
    @branch = Branch.find(params[:id])
    json_response(@branch)
  end

  def create
    @branch = Branch.create!(branch_params)
    json_response(@branch, :created)
  end

  def update
    @branch = Branch.find(params[:id])
    @branch.update!(branch_params)
    json_response(@branch, :accepted)
  end

  def destroy
    @branch = Branch.find(params[:id])
    if @branch.destroy!
      render status: 200, json: {
       message: "Delete successful!"
       }
    end
  end

  private
  def branch_params
    params.permit(:location)
  end
end
