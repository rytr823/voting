class VotesController < ApplicationController
  before_action :set_choice

  def create
    @vote = Vote.new(vote_params)
    @already_votes = @choice.content.votes
    @already_vote = @already_votes.find_by(user_id: @vote.user_id)
    overlap_adjustment
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

  def overlap_adjustment
    if @already_votes.nil?
      @vote.save
    elsif @already_vote.nil?
      @vote.save
    elsif @already_vote.user_id == current_user.id && @vote.content_id == @already_vote.content_id
      @already_vote.destroy
      @vote.save
    else
      @vote.save
    end
  end
end