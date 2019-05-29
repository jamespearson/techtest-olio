require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do 
    @posts = create_list(:post, 10)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns @posts" do
      get :index
      expect(assigns(:posts)).to eq(Post.active.order(listed_at: :desc))
    end

  end


  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: @posts[0].id}
      expect(response).to have_http_status(:success)
    end

    it "assigns @post" do
      post_id = @posts[0].id
      get :show, params: {id: post_id}
      expect(assigns(:post)).to eq(Post.find(post_id))
    end
  end


  describe "DELETE #destroy" do
    before(:each) do
      @post_id = Post.active.first.id
    end
    it "returns http success" do
      delete :destroy, params: {id: @post_id}
      expect(response).to have_http_status(:found)
    end

    it "assigns @post" do
      delete :destroy, params: {id: @post_id}
      expect(assigns(:post)).to eq(Post.find(@post_id))
    end

    it "updates the status of the post" do
      expect{
        delete :destroy, params: {id: @post_id}
      }.to change{Post.find(@post_id).status}.from("active").to("deleted")
    end
  end

end
