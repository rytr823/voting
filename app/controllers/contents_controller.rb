class ContentsController < ApplicationController
  def index
    @contents = Content.includes(:user).order("created_at DESC")
  end  
end
