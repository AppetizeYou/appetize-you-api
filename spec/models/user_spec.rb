require "rails_helper"

RSpec.describe User, type: :model do
    subject {
        described_class.new(
            email: "test1@test.com",
            username: "test",
            password: "123123",
            password_confirmation: "123123",
        )
    }

    it "should successfully create a user with all given details" do
        expect(subject).to be_valid
    end

    it "should cause an error if the email is not given" do
        subject.email = ""
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the username is not given" do
        subject.username = ""
        
        expect(subject).not_to be_valid
    end

    # it "should cause an error if the password is not given" do
    #     subject.password = ""
        
    #     expect(subject).not_to be_valid
    # end

    it "should cause an error if the password_confirmation is not given" do
        subject.password_confirmation = ""
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the password and password_confirmation are not the same" do
        subject.password_confirmation = "123qwe"

        expect(subject).not_to be_valid
    end

    #   pending "add some examples to (or delete) #{__FILE__}"
end
