class SubmissionsController < ApplicationController
    before_filter :authenticate_user!, only: [:create]
  # before_filter :authenticate_associate!, only: [:index, :destroy]

  def create
    @submission = Submission.new(submission_params)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to auditions_path, notice: 'Thanks for submitting!' }
        format.json { render action: 'show', status: :created, location: @submission }
      else
        format.html { render action: 'new' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @audition = Audition.find_by(id: params[:audition_id])
    @submissions = @audition.submissions
    if params[:search]
      @role = Role.find_by(id: params[:search])
      submitted_actors = @audition.users
      @actors = submitted_actors.includes(:roles).where(roles: { id: params[:search] })
    elsif params[:gender] || params[:ethnic_appearance] || params[:age_range] || params[:equity] || params[:special_skills]
      submitted_actors = @audition.users
      @actors = submitted_actors.where({gender: params[:gender], ethnic_appearance: params[:ethnic_appearance], age_range: params[:age_range], equity: params[:equity]}).where("special_skills like ?", "%#{params[:special_skills]}%")
    else
      @actors = @audition.users.order(:last_name)
    end
  end

  def destroy
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :audition_id)
  end

end
