class PoptartsController < ApplicationController
  respond_to :json

  def index
    respond_with Poptart.all
  end

  def show
    respond_with Poptart.find(params[:id])
  end

  def create
    poptart = Poptart.create(poptart_params)
    respond_with poptart
  end

  def update
    poptart = Poptart.find(params[:id])
    respond_with poptart.update_attributes(poptart_params)
  end

  private

  def poptart_params
    params.require(:poptart).permit(:flavor, :sprinkles)
  end
end
