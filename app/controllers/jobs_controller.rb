class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @actor = User.find_by(params[:id])
    @jobs = @actor.jobs.order(:created_at)
    @job = Job.new
    @job.role_id = params[:role_id]
    @job.theatre_id = params[:theatre_id]
    @job.user_id = current_user.id

    respond_to do |format|
      if @job.save
        format.html { redirect_to root_path, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created }
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
        format.js {}
      end
    end

  end

  private

    def todo_params
      params.require(:job).permit(:role_id, :theatre_id, :user_id)
    end

end
