class ContentsController < ApplicationController
  def index
    @contents = Content.includes(:user, :choices).order("created_at DESC")
  end  
end