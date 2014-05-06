class ActorsController < ApplicationController
  def show
    @actor = User.find_by(params[:id])
  end
end
