class PottiesController < ApplicationController
  before_action :set_potty, only: [:show, :update, :destroy]

  # GET /potties
  def index
    @potties = Potty.all

    render json: @potties
  end

  # GET /potties/1
  def show
    render json: @potty
  end

  # POST /potties
  def create
    @potty = Potty.new(potty_params)

    if @potty.save
      render json: @potty, status: :created, location: @potty
    else
      render json: @potty.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /potties/1
  def update
    if @potty.update(potty_params)
      render json: @potty
    else
      render json: @potty.errors, status: :unprocessable_entity
    end
  end

  # DELETE /potties/1
  def destroy
    @potty.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potty
      @potty = Potty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def potty_params
      params.require(:potty).permit(:number, :notes, :date, :location)
    end
end
