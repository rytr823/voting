class VotesController < ApplicationController
  before_action :set_choice

  def create
    @vote = Vote.new(vote_params)
    already_vote(@vote).destroy if overlap_adjustment?(@vote)
    @vote.save

    # choiceの再セット
    @choice.reload
    @choices = @choice.content.choices
  end

  def destroy
    vote = Vote.find_by(vote_params)
    vote.destroy
    @choice.reload
  end

  private

  def vote_params
    params.permit(id: @choice.id).merge(user_id: current_user.id, content_id: @choice.content_id, choice_id: @choice.id)
  end

  def set_choice
    @choice = Choice.find(params[:id])
  end

  def overlap_adjustment?(vote)
    is_exist_already_vote = already_vote(vote)&.user_id == current_user.id
    is_exist_content_vote = already_vote(vote)&.content_id
    return is_exist_already_vote && is_exist_content_vote
  end

  def already_vote(vote)
    already_votes = @choice.content.votes
    if already_votes.nil?
      return nil
    end
    already_vote = already_votes.find_by(user_id: vote.user_id)
  end
  
end
