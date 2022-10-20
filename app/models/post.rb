class Post < ApplicationRecord
    # validates :title, presence: true
    # validates :content, presence: true
    # validate :posting_too_often

    belongs_to :user

end



Post.where("user_id is null").each do |ps|
    ps.user_id = User.ids.sample
    ps.save
end