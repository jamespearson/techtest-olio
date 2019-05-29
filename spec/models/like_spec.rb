require 'rails_helper'

RSpec.describe Like, type: :model do

  it ("should belong to a post") do
    should belong_to(:post)
  end

  it ("should require a post") do
    should validate_presence_of(:post)
  end

  it("should update the counter_cache on post when created") do

    @post = create(:post)

    expect{
      like = Like.new
      like.post = @post
      like.save
    }.to change{Post.find(@post.id).likes_count}.from(0).to(1)
  end

  it("should update the counter_cache on post when deleted") do

    @like = create(:like)
    @post = @like.post

    expect{
      @like.destroy
    }.to change{Post.find(@post.id).likes_count}.from(1).to(0)
    
  end

end
