class ContentsController < ApplicationController
  def index
    @contents = Content.includes(:user, :choices).order("created_at DESC")
    # @choices = Choice.includes(:content).order("created_at DESC")
    
    # binding.pry
    
  end  
end