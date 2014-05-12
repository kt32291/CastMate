class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to root_url, notice: "Successfully created job."
    else
      render :new
    end
  end

end
