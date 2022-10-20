module Mutations
  # inherit Mutations::BaseMutation
  class CreatePost < Mutations::BaseMutation
    # Define what type of value to be returned
    field :post, Types::PostType, null: false

    # Define what argument this mutation accepts    argument :id, ID, required: true
    argument :title, String, required: true
    argument :content, String, required: true
    argument :author, String, required: true
    argument :rate, String, required: true

    def resolve( title:, content:, author:, rate:)
      # we will use current_user in future
      post = Post.new( title: title, content: content, author: author, rate: rate, created_at: Time.now, updated_at: Time.now, user_id: 4)
      puts "Post created with data: #{post}"
      # Here returns post field, which is defined above.
      if post.save
        {
          post: post,
          errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          post: {},
          errors: post.errors.full_messages
        }
      end
    end
  end
end

