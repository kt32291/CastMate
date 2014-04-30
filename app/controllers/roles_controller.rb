class RolesController < ApplicationController
  before_action :set_role, only: [:update, :destroy]

  def create
    @role = Role.new(role_params)
    @role.save
  end

  def update
    @role.update(role_params)
  end

  def destroy
    @role.destroy
  end


  private

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:character_name, :play_id)
    end

end
