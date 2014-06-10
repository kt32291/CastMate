class PlaysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_play, only: [:show, :update, :destroy]

  def index
    @public_plays = Play.where(publix: true)
    @plays = @public_plays.order(:title).where("title like ?", "%#{params[:term]}%")
    render json: @plays.map(&:title)
  end

  def full_index
    @plays = Play.order(:title).where(id: params[:term])
    render json: @plays.map()
  end

  def all_index
    @public_plays = Play.where(publix: true)
    @plays = @public_plays.order(:title).where(title: params[:term])
    render json: @plays.map()
  end

  def show
    @roles = @play.roles
  end

  def create
    @play = Play.new(play_params)
    @play.save
  end

  def update
    @play.update(play_params)
  end

  def destroy
    @play.destroy
  end

  private

    def set_play
      @play = Play.find(params[:id])
    end

    def play_params
      params.require(:play).permit(:title, :type_of_show, :author, :music_by)
    end

end
