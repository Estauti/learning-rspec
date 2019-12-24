class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all

    render json: @weapons, status: :ok
  end

  def show
    begin
      render json: Weapon.find(params[:id]), status: :ok
    
    rescue ActiveRecord::RecordNotFound 
      head(:not_found)
    end
  end

  def create
    @weapon = Weapon.new(weapon_params)

    if @weapon.save
      render json: @weapon, status: :created
    else
      render json: { error: @weapon.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @weapon = Weapon.find(params[:id])
      @weapon.destroy
      head(:ok)
    
    rescue ActiveRecord::RecordNotFound 
      head(:not_found)
    end
  end

  private

    def weapon_params
      params.require(:weapon).permit(:name, :description, :power_base, :power_step, :level)
    end
end
