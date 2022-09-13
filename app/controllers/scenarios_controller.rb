class ScenariosController < ApplicationController
  
  def new
    @scenario = Scenario.new
  end
  
  def create
    @scenario = Scenario.new(scenario_params)
    @scenario.user_id = current_user.id
    if @scenario.save
      redirect_to scenario_path(@scenario)
    else
    render :new
    end
  end
  
  def index
    @scenarios = Scenario.all
  end
  
  def show
    @scenario = Scenario.find(params[:id])
    @user = @scenario.user
  end
  
  def edit
    @scenario = Scenario.find(params[:id])
    if @scenario.user_id == current_user.id
      render :edit
    else
      redirect_to new_scenario_path
    end
  end
  
  def update
    @scenario = Scenario.find(params[:id])
    @scenario.user_id = current_user.id
    if @scenario.update(scenario_params)
      redirect_to scenario_path(@scenario.id)
    else
      render :edit
    end
  end
  
  def destroy
    @scenario = Scenario.find(params[:id])
    if @scenario.destroy
      redirect_to scenarios_path
    end
  end
  
  private
  
  def scenario_params
    params.require(:scenario).permit(:user_id,:genre_id,:title,:overview,:content)
  end
  
end
