class PostsController < ApplicationController

  before_action :find_post, only: [:show, :destroy]

  def index
    
    PostsImportJob.perform_now unless Rails.env.test?

    @posts = Post.active.order(listed_at: :desc)
  end

  def show
    
  end

  def destroy
    @post.status = :deleted
    @post.save

    redirect_to posts_path
  end

  protected

  def find_post
    @post = Post.find(params[:id])
  end

end
