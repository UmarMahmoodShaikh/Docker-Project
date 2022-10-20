module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, 
    [Types::PostType],
    null: false, 
    description: "Return a list of posts"

    field :users,
    [Types::UserType],
    null:false,
    description: "Return a list of users"

    def posts
      Post.all
    end 
    def users
      User.all
    end 
  end
end
############## EXAMPLE ###################
# module Types
#   class QueryType < Types::BaseObject
#     # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
#     include GraphQL::Types::Relay::HasNodeField
#     include GraphQL::Types::Relay::HasNodesField

#     # Add root-level fields here.
#     # They will be entry points for queries on your schema.

#     # TODO: remove me
#     field :posts, String, null: false,
#       description: "An example field added by the generator"
#     def test_field
#       "Hello World!"
#     end
#   end
# end
