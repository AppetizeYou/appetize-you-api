class AddPreviousMessageToMessage < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :previous_message, foreign_key: { to_table: :messages }
  end
end
