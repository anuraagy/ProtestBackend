class PostsController < ApplicationController
  def search
    search_params = {}

    search_params[:id]            = params[:id]        if params[:id]
    search_params[:content]       = params[:content]   if params[:content]
    search_params[:user]          = params[:user]      if params[:user]
    search_params[:movement_id]   = params[:location]  if params[:movement_id]

    render :json => Post.where(search_params)
  end

  def index
    render :json => Post.all
  end

  def build
    @post = Post.new(post_params)

    if @post.save
      render :json => @post
    else
      render :json => { :errors => @post.errors.full_messages }
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render :json => @post
    else
      ender :json => { :errors => @post.errors.full_messages }
    end
  end

  def show
    @post = Post.find(params[:id])
    render :json => @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    render :json => {:response => "post has been destroyed"}
  end

  private

  def post_params
    params.permit(:content, :user, :movement_id)
  end

  def check_user

  end
end
