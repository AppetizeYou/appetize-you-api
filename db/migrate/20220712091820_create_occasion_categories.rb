class CreateOccasionCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :occasion_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
