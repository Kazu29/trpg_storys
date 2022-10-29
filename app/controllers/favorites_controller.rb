class FavoritesController < ApplicationController
  
  def create
    scenario = Scenario.find(params[:scenario_id])
    favorite = current_user.favorites.new(scenario_id: scenario.id)
    favorite.save
    redirect_to scenario_path(scenario)
  end

  def destroy
    scenario = Scenario.find(params[:scenario_id])
    favorite = current_user.favorites.find_by(scenario_id: scenario.id)
    favorite.destroy
    redirect_to scenario_path(scenario)
  end
  
end
