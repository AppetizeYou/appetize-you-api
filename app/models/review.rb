class Review < ApplicationRecord
    belongs_to :reviewer, class_name: "User"

    belongs_to :reviewable, polymorphic: true

    def beautify_review

    end
end
