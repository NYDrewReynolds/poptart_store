class PoptartsController < ApplicationController
  respond_to :json
  before_action :find_poptart, only: [:update, :destroy, :show]

  def index
    respond_with Poptart.all
  end

  def show
    respond_with @poptart.as_json(promotion: params[:promotion])
  end

  def create
    poptart = Poptart.create(poptart_params)
    respond_with poptart
  end

  def update
    respond_with @poptart.update_attributes(poptart_params)
  end

  def destroy
    respond_with @poptart.destroy
  end

  private

  def poptart_params
    params.require(:poptart).permit(:flavor, :sprinkles)
  end

  def find_poptart
    @poptart = Poptart.find(params[:id])
  end
end
