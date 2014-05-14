class TheatresController < ApplicationController
  before_action :set_theatre, only: [:update, :destroy]

  def index
    @theatres = Theatre.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @theatres.map()
  end

  def create
    @theatre = Theatre.new(theatre_params)
    @theatre.save
  end

  def update
    @theatre.update(role_params)
  end

  def destroy
    @theatre.destroy
  end


  private

    def set_theatre
      @theatre = Theatre.find(params[:id])
    end

    def theatre_params
      params.require(:theatre).permit(:name, :city, :theatre_type)
    end

end
