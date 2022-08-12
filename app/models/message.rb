class Message < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :recipient, class_name: "User"

    validates_presence_of :text

    def beautify_message
        return({ id: self.id, title: self.title, text: self.text, sent_at: self.created_at, sender: self.sender.username, recipient: self.recipient.username, previous_message_id: self.previous_message_id })
    end

    def check_ownership(user)
        return self.sender == user || self.recipient == user
    end

    def self.find_by_sender(user)
        return self.where(sender: user)
    end

    def self.find_by_recipient(user)
        return self.where(recipient: user)
    end
end
