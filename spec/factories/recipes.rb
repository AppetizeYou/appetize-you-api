FactoryBot.define do
    factory :recipe do
        title { "MyString" }
        serve { 1 }
        type_category_id { 1 }
        occasion_category_id { 1 }
        main_ingredient_category_id { 1 }
        cooking_method_category_id { 1 }
    end
end
