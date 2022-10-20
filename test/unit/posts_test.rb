require 'test_helper'
class PostsTest < ActiveSupport::TestCase

    test "Save New Post" do
        post = Post.new 
        post.save
    end

    test "Delete Post" do
        # post = Post.find(99).destroy.save
        # puts "#{post}"
    end

    test "Update Post" do
        x = posts(:one)
        post = Post.update({:title => "Naya Title",:content => "Naya Content",:author => "Naya Author",:rate => 4,:user_id => 99})
        puts "#{post}"
    end
end