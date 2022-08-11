class Recipe < ApplicationRecord
    belongs_to :author, class_name: "User"

    belongs_to :type_category
    belongs_to :occasion_category
    belongs_to :main_ingredient_category
    belongs_to :cooking_method_category

    has_one_attached :image

    has_many :reviews, as: :reviewable

    validates :title, presence: true
    validates :serve, presence: true
    validates :ingredients, presence: true
    validates :steps, presence: true

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
