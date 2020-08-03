class VotesController < ApplicationController
  before_action :set_choice

  def create
    @vote = Vote.new(vote_params)
    @already_vote = Vote.find_by(content_id: @vote.content_id)
    overlap_adjustment
    @choice.reload
    @votes = Vote.where(choice_id: @choice.id)
  end

  def destroy
    vote = Vote.find_by(vote_params)
    vote.destroy
    @votes = Vote.where(choice_id: @choice.id)
    @choice.reload
  end

  private
  def vote_params
    params.permit(id: @choice.id).merge(user_id: current_user.id, content_id: @choice.content_id, choice_id: @choice.id)
  end

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def overlap_adjustment
    if @already_vote == nil
      @vote.save
    elsif @vote.user_id == current_user.id && @vote.content_id == @already_vote.content_id
      @already_vote.destroy
      @vote.save
    else
      @vote.save
    end
  end
end
