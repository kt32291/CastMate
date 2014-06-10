class CallsheetsController < ApplicationController
  before_action :set_callsheet, only: [:update, :destroy]

  def create
    @callsheet = Callsheet.new(callsheet_params)

    respond_to do |format|
      if @callsheet.save
        format.html { redirect_to '/submissions/' + @callsheet.audition_id.to_s, notice: 'Actor saved!' }
        format.json { render action: 'show', status: :created, location: @callsheet }
      else
        format.html { render action: 'new' }
        format.json { render json: @callsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @audition = Audition.find_by(id: params[:audition_id])
    @callsheets = Callsheet.where(audition_id: params[:audition_id])
  end

  def destroy
    @callsheet.destroy
    respond_to do |format|
      format.html { redirect_to '/callsheets/' + @callsheet.audition_id.to_s }
      format.json { head :no_content }
    end
  end

  private

  def set_callsheet
    @callsheet = Callsheet.find(params[:id])
  end

  def callsheet_params
    params.require(:callsheet).permit(:user_id, :audition_id, :role_name, :status, :conflicts, :notes, :wave, :rec_by)
  end


end
