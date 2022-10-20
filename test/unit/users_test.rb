require 'test_helper'
class UsersTest < ActiveSupport::TestCase

    test "Save New Post" do
       post = User.new 
        post.save
    end

    
end