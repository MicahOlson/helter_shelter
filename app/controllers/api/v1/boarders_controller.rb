class Api::V1::BoardersController < ApplicationController
  swagger_controller :boarders, "Boarder Management"

  def search
    params[:q] ? (query = params[:q]) : (query = '')
    @results = Boarder.search(query)
    if @results.any?
      json_response(@results)
    else
      render status: 404, json: {
        message: "No breeds match the query #{params[:q]}."
      }
    end
  end

  def index
    branch = Branch.find(params[:branch_id])
    @boarders = branch.boarders
    if @boarders.empty?
      render status: 200, json: {message: "Hurray, all our boarders found families! Try another branch."}
    else
      json_response(@boarders)
    end
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
      render status: 200, json: {message: "Delete successful!"}
    end
  end

  private def boarder_params
    params.permit(:name, :kind, :breed, :gender, :age, :description, :branch_id)
  end

  #Swagger::Docs
  swagger_api :search do
    summary "Fetches all boarders if query is blank, or by breed if supplied."
    notes "Input a Breed below and click 'try it out!' to fetch a list of all available pets of this breed. Leave the query blank to simply return a list of all boarders across all branches."
    param :query, :q, :string, :optional, "Breed"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :index do
    summary "Fetches all boarders at a branch"
    notes "Input a Branch ID number below and click 'try it out!' to fetch a list of all available pets at this location."
    param :path, :branch_id, :integer, :required, "Branch ID"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :show do
    summary "Fetches a single boarder at a branch"
    notes "Input the Branch and Boarder ID numbers below and click 'try it out!' to fetch a specific boarder."
    param :path, :branch_id, :integer, :required, "Branch ID"
    param :path, :id, :integer, :required, "Boarder ID"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :create do
    summary "Creates a new boarder"
    notes "Input the Branch ID where this pet will be boarded, along with its Name, Kind (Species), and Breed (all required). Optionally, you can include Gender, Age, and a Description, as well. Click 'try it out!' to create the new boarder."
    param :path, :branch_id, :integer, :required, "Branch ID"
    param :form, :name, :string, :required, "Boarder name"
    param :form, :kind, :string, :required, "Species"
    param :form, :breed, :string, :required, "Breed"
    param :form, :gender, :string, :optional, "Gender"
    param :form, :age, :string, :optional, "Age"
    param :form, :description, :string, :optional, "Description"
    response :ok, "Success"
    response :created, "Created"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :update do
    summary "Updates an existing boarder"
    notes "Input Branch and Boarder ID numbers, and revisions to the boarder's details, and click 'try it out!' to update an existing boarder's record."
    param :path, :branch_id, :integer, :required, "Branch ID"
    param :path, :id, :integer, :required, "Boarder ID"
    param :form, :name, :string, :required, "Boarder name"
    param :form, :kind, :string, :required, "Species"
    param :form, :breed, :string, :required, "Breed"
    param :form, :gender, :string, :optional, "Gender"
    param :form, :age, :string, :optional, "Age"
    param :form, :description, :string, :optional, "Description"
    response :ok, "Success"
    response :accepted, "Accepted"
    response :not_found
    response :unprocessable_entity
  end

  swagger_api :destroy do
    summary "Deletes an existing boarder"
    notes "Input the Branch and Boarder ID numbers below to fetch a specific boarder and click 'try it out!' to remove it from the database."
    param :path, :branch_id, :integer, :required, "Branch ID"
    param :path, :id, :integer, :required, "Boarder ID"
    response :ok, "Delete successful"
    response :not_found
    response :unprocessable_entity
  end
end
