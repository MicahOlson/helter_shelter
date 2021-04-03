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
    notes "This lists all branch locations"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :show do
    summary "Fetches a single branch"
    notes "This renders a single branch location by id"
    param :path, :id, :integer, :required, "Location ID"
    response :ok, "Success", :Branch
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :create do
    summary "Creates a new branch"
    notes "This creates a new branch location"
    param :form, :location, :string, :required, "Location name"
    response :ok, "Success", :Branch
    response :created, "Created", :Branch
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :update do
    summary "Updates an existing branch"
    notes "This updates an existing branch location"
    param :path, :id, :integer, :required, "Location ID"
    param :form, :location, :string, :required, "Location name"
    response :ok, "Success", :Branch
    response :accepted, "Accepted", :Branch
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :destroy do
    summary "Deletes an existing branch"
    param :path, :id, :integer, :required, "Location ID"
    response :ok, "Delete successful", :Branch
    response :not_found
    response :unprocessable_entity
  end
end
