class CommentsController < ApplicationController
  before_action :check_user

  def index
    render :json => Comment.all
  end

  def build
    @comment = Comment.new(comment_params)

    if @comment.save
      render :json => @comment
    else
      render :json => { :errors => @comment.errors.full_messages }
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      render :json => @comment
    else
      ender :json => { :errors => @comment.errors.full_messages }
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :json => @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    render :json => {:response => "comment has been destroyed"}
  end

  private

  def comment_params
    params.permit(:content, :post, :user)
  end

  def check_user

  end
end
