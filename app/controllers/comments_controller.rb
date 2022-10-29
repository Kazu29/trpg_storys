class CommentsController < ApplicationController
  
  def create
    scenario = Scenario.find(params[:scenario_id])
    review = current_user.comments.new(comment_params)
    review.scenario_id = scenario.id
    review.save
    redirect_to scenario_path(scenario)
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to scenario_path(params[:scenario_id])
  end
  
  
  private

  def comment_params
    params.require(:comment).permit(:review)
  end
  
end
