class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :update, :destroy]

  def index
    @plays = Play.all.order('title')
    @musicals = Play.where(type_of_show: "Musical")
    @straight_plays = Play.where(type_of_show: "Play")
    @operas = Play.where(type_of_show: "Opera")
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
