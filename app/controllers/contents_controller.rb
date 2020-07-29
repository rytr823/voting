class ContentsController < ApplicationController
  def index
    @contents = Content.includes(:user, :choices).order("created_at DESC")
  end  

  def new
    @content = Content.new
    @choices = @content.choices.build
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def content_params
    params.require(:content)
    .permit(:title, choices_attributes: [:id, :text, :content_id, :_destroy])
    .merge(user_id: current_user.id)
  end
end