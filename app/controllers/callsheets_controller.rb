class CallsheetsController < ApplicationController

  def create
    @callsheet = Callsheet.new(callsheet_params)

    respond_to do |format|
      if @callsheet.save
        format.html { redirect_to '/submissions/<%= @callsheet.audition_id %>', notice: 'Actor saved!' }
        format.json { render action: 'show', status: :created, location: @callsheet }
      else
        format.html { render action: 'new' }
        format.json { render json: @callsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @callsheets = Callsheet.where(audition_id: params[:audition_id])
  end

  private

  def callsheet_params
    params.require(:callsheet).permit(:user_id, :audition_id, :role_name, :status, :conflicts, :notes, :wave, :rec_by)
  end


end
