class Api::V1::BranchesController < ApplicationController
  swagger_controller :branches, "Branch Management"

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

  private def branch_params
    params.permit(:location)
  end

  #Swagger::Docs
  swagger_api :index do
    summary "Fetches all branches"
    notes "Click 'try it out!' below to fetch a list of all Helter Shelter locations."
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :show do
    summary "Fetches a single branch"
    notes "Input a Branch ID number below and click 'try it out!' to fetch a specific location."
    param :path, :id, :integer, :required, "Branch ID"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :create do
    summary "Creates a new branch"
    notes "Input a Location name (required) and click 'try it out!' to create a new branch."
    param :form, :location, :string, :required, "Location name"
    response :ok, "Success"
    response :created, "Created"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :update do
    summary "Updates an existing branch"
    notes "Input a Branch ID number and revisions to its Location name below, then click 'try it out!' to update the record."
    param :path, :id, :integer, :required, "Branch ID"
    param :form, :location, :string, :required, "Location name"
    response :ok, "Success"
    response :accepted, "Accepted"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :destroy do
    summary "Deletes an existing branch"
    notes "Input a Branch ID number below and click 'try it out!' to remove it from the database. Warning, this will delete all boarders at this branch, as well!"
    param :path, :id, :integer, :required, "Branch ID"
    response :ok, "Delete successful"
    response :not_found
    response :unprocessable_entity
  end
end
