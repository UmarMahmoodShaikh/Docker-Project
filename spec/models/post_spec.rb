require 'rails_helper'
RSpec.describe Post, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
  subject { Post.new(id:1,title: "Jack", author: "Smith",
     content: "jsmithamplecom" , rate: 2,user_id:980190962,
    created_at:"2022-07-19 10:52:39.666",updated_at:"2022-07-19 10:52:39.666")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid with nil  attributes" do
    subject=Post.new(title: nil)
    puts"#{subject}"
    expect(subject).to_not be_valid
  end
end