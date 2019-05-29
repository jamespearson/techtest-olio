require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  
  before(:each) do 
    @post = create(:post)
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {post_id: @post.id}
      expect(response).to have_http_status(:success)
    end

    it "updates the status of the post" do
      
      expect{
        post :create, params: {post_id: @post.id}
      }.to change{Post.find(@post.id).likes_count}.from(0).to(1)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, params: {post_id: @post.id}
      expect(response).to have_http_status(:success)
    end

    it "updates the status of the post" do
      create(:like, post: @post)
      
      expect{
        delete :destroy, params: {post_id: @post.id}
      }.to change{Post.find(@post.id).likes_count}.from(1).to(0)
    end
  end

end
