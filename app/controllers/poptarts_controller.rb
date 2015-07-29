class PoptartsController < ApplicationController
  respond_to :json
  before_action :find_poptart, only: [:update, :destroy, :show]

  def index
    if params[:promotion] == 'halloween'
      respond_with Poptart.all, each_serializer: HalloweenPoptartSerializer
    else
      respond_with Poptart.all
    end
  end

  def show
    if params[:promotion] == 'halloween'
      respond_with @poptart, serializer: HalloweenPoptartSerializer
    else
      respond_with @poptart
    end
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
