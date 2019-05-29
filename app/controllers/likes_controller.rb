class LikesController < ApplicationController

  before_action :find_post
  after_action :update_cookie

  def create
    @post.likes.create()
    redirect_to root_path
  end

  def destroy
    # Will only destroy a like if there is one to destroy
    @post.likes.last&.destroy
    redirect_to root_path
  end

  protected_methods

  def find_post
    @post = Post.find(params[:post_id])
  end

  def update_cookie
    liked_ids = Like.all.select(:post_id)
    cookies[:likes] = liked_ids.map(&:post_id)
  end 

end
