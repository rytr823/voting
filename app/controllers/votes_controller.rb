class VotesController < ApplicationController
  before_action :set_choice

  def create
    @vote = Vote.create(vote_params)
    @votes = Vote.where(choice_id: @choice.id)
    @choices = Choice.all
  end

  def destroy
    vote = Vote.find_by(vote_params)
    vote.destroy
    @votes = Vote.where(choice_id: @choice.id)
    @choices = Choice.all
  end

  private
  def vote_params
    params.permit(id: @choice.id).merge(user_id: current_user.id, content_id: @choice.content_id, choice_id: @choice.id)
  end

  def set_choice
    @choice = Choice.find(params[:id])
  end
end
