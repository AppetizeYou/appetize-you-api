class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, null: false
      t.text :comment

      t.timestamps
    end
  end
end
