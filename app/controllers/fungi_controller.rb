class FungiController < ApplicationController
  def index
    if params[:fungus].present?
      @fungus = Fungus.new(fungus_params)
      @fungi = Fungus.where(fungus_params)
    else
      @fungus = Fungus.new()
      @fungi = []
    end
  end

  private

  def fungus_params
    params.require(:fungus).permit(:cap_shape)
    # params.permit(:cap_shape)
  end
end
