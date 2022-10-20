module Mutations
  # Don't forget to change to Mutations::BaseMutation
  class DestroyPost < Mutations::BaseMutation
    field :id, ID, null: true
    argument :id, ID, required: true
    def resolve(id:)
      post = Post.find(id)
      puts "Post with id: #{id} is deleted"
      post.destroy
    end
  end
end