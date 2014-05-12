class ActorsController < ApplicationController
  def show
    @actor = User.find_by(params[:id])
    @jobs = @actor.jobs
    @job = Job.new
  end
end
