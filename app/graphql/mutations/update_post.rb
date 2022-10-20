module Mutations
  # inherit Mutations::BaseMutation
  class UpdatePost < Mutations::BaseMutation
    # Define what type of value to be returned
    field :post, Types::PostType, null: true

    # Define what argument this mutation accepts
    argument :id, Int, required: true
    
    argument :title, String, required: false
    argument :content, String, required: false
    argument :author, String, required: false
    argument :rate, String, required: false
   

    def resolve(id:,title:,author:,content:,rate:)
      post = Post.find(id)
      puts "Post found with user_id: #{post.user_id} and updated with new arguments"
      if post.update(title:title,author:author,content:content,rate:rate,created_at:Time.now,updated_at:Time.now,user_id:2)
        {
          post: post,
          errors: [],
        }
      else
        { errors: item.errors.full_messages }
      end
    # end
  end
end
end
