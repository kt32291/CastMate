class ActorsController < ApplicationController
  before_action :authenticate_user!

  def show
    @actor = User.find_by(id: params[:id])
    @jobs = @actor.jobs.order(:created_at)
    @job = Job.new
  end

  def index
    if params[:search]
      @role = Role.find_by(id: params[:search])
      @actors = User.includes(:roles).where(roles: { id: params[:search] })
    else
      @actors = User.all.order(:last_name)
    end
  end

end
