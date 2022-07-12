class AddRecipientToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :recipient, null: false, foreign_key: {to_table: :users}
  end
end
