class ActorsController < ApplicationController
  def show
    @actor = User.find_by(params[:id])
    @jobs = @actor.jobs.order(:created_at)
    @job = Job.new
  end
end
