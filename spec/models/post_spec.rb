require 'rails_helper'
require Rails.root.join("spec/concerns/remote_id.rb")
require Rails.root.join("spec/concerns/image_url.rb")

RSpec.describe Post, type: :model do
  
  it_behaves_like "has_image_url"
  it_behaves_like "has_remote_id"

  it "should require a description" do
    should validate_presence_of(:description)
  end

  it "should require an expiry date" do
    should validate_presence_of(:expires_at)
  end

  context "likes" do

    it "should have many likes" do
      should have_many :likes
    end

    it "should cache the like count" do
      should respond_to?(:likes_count)
    end

    it "should delete the likes if the post is deleted" do
      @like = create(:like)
      @post = @like.post

      expect{
        @post.destroy
      }.to change{Like.where(post_id: @post.id).count}.from(1).to(0)

    end

    it "should provide a sum of local and remote likes" do
      should respond_to?(:total_likes)

      @post = create(:post, remote_like_count: 99)
    
      expect{
        @like = create(:like, post: @post)  
      }.to change{Post.find(@post.id).total_likes}.from(99).to(100)
    end
  end


  it "should have a listed_at date" do
    should validate_presence_of(:listed_at)
  end
  

  it "should require a title" do
    should validate_presence_of(:title)
  end

  it "should belong to a user" do
    should belong_to(:user)
  end

  it "should require a user" do
    should validate_presence_of(:user)
  end

end
