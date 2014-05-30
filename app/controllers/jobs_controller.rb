class JobsController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.new
  end

  def create
    @actor = User.find_by(params[:id])
    @jobs = @actor.jobs.order(:created_at)
    @job = Job.new

    # if params[:play_id] == nil
    #   play = Play.find_or_create_by(title: params[:plays_value])
    #   play.update_attributes(publix: false)

    #     Role.find_or_create_by(character_name: params[:roles_value]) do |role|
    #       role.play_id = play.id
    #       role.publix = false
    #     end

    # else

    #   if params[:role_id] == nil
    #     Role.find_or_create_by(character_name: params[:roles_value]) do |role|
    #       role.play_id = params[:play_id]
    #       @job.role_id = role.id
    #     end
    #   end

    # end



    role_name = params[:character_name]
    role = Role.find_by(character_name: role_name)
    @job.role_id = role.id
    theatre_name = params[:theatre_name]
    theatre = Theatre.find_by(name: theatre_name)
    @job.theatre_id = theatre.id
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
      params.require(:job).permit(:role_id, :theatre_id, :user_id, :theatre_name, :character_name)
    end

end
