class Review < ApplicationRecord
    belongs_to :reviewer, class_name: "User"

    belongs_to :reviewable, polymorphic: true

    def beautify_review
        return({ reviewer: self.reviewer.username, comment: self.comment, rating: self.rating, created_at: self.created_at })
    end
end
