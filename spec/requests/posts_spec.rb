require 'rails_helper'
RSpec.describe "Post test", :type => :request do
  describe "creates a Post" do
    subject(:request_response){
      post posts_url, params: { post: { author: "postauthor", content: "postcontent", rate: 5, title: "post_title" } }
      response
    }
    it do
      puts "Created post with respone code as: #{subject.status}"
      expect(subject.status).to eq(200)
    end
  end
  
  describe "update a Post" do
    subject(:request_response){
      put "/posts/1", params: { post: { author: "postauthor1", content: "postcontent1", rate: 8, title: "post_title1" } }
      response
    }
    it do
      puts "Updated post with respone code as: #{subject.status}"
      #rediect to show posts page
      expect(subject.status).to eq(200)
    end
  end
  describe "show a Post" do
    subject(:request_response){
      get "/posts"
      response
    }
    it do
      puts "Showed post with respone code as: #{subject.status}"
      #rediect to show posts page
      expect(subject.status).to eq(200)
    end
  end
  
  describe "delete a Post" do
    subject(:request_response){
      delete "/posts/1"
      response
    }
    it do
      puts "Deleted post with respone code as: #{subject.status}"
      #rediect to show posts page
      expect(subject.status).to eq(200)
    end
  end

end