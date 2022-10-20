module Types
    class PostAttributes < Types::BaseInputObject
        
        description "Attributes for creating or updating a blog post"    
        argument :title, String, required: false
        argument :content, String, required: false
        argument :author, String, required: false
        argument :rate, String, required: false
        argument :created_at,"2022-07-13 13:26:11.671", String, required: false
        argument :updated_at, "2022-07-13 13:26:11.671", String, required: false
        argument :user_id, ID, 4,required: false
    end
end