class ContentsController < ApplicationController
  def index
    @contents = Content.includes(:user, :choices).order('created_at DESC')
  end

  def new
    @content = Content.new
    2.times { @content.choices.build }
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    if content.update(content_params)
    else
      render :edit
    end
  end

  def destroy
    content = Content.find(params[:id])
    if content.destroy
    else
      render :index
    end
  end

  private

  def content_params
    params.require(:content)
          .permit(:title, choices_attributes: [:id, :text, :image, :content_id, :_destroy])
          .merge(user_id: current_user.id)
  end
end
