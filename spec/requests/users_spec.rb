require "rails_helper"

RSpec.describe "Users", type: :request do
    before(:each) { FactoryBot.create(:user, email: "rspectest@test.com", username: "rspectest", password: "123qwe", password_confirmation: "123qwe") }

    describe "at /auth/signup" do
        it "returns created user's username and jwt on POST request" do
            post "/auth/signup", params: { email: "test1@test.com", username: "test1", password: "123123", password_confirmation: "123123" }

            expect(response).to have_http_status(:created)

            user = JSON.parse(response.body)

            expect(user.size).to eq(2)
        end
    end

    describe "at /auth/login" do
        it "returns logged in user's username and jwt on POST request" do
            post "/auth/login", params: { email: "rspectest@test.com", password: "123qwe" }

            expect(response).to have_http_status(:success)

            user = JSON.parse(response.body)

            expect(user.size).to eq(2)
        end
    end

    describe "at /auth" do
        it "returns current user's account details on GET request" do
            get "/auth", headers: authenticated_header(User.where(username: "rspectest").first)

            keys = JSON.parse(response.body).keys

            expect(keys).to include("email")
            expect(keys).to include("username")
            expect(keys).to include("password_digest")
        end

        it "returns current user's updated username (if changed) and jwt on PUT request" do
            old_username = User.where(username: "rspectest").first.username

            put "/auth", params: {username: "rspectestupdate"}, headers: authenticated_header(User.where(username: "rspectest").first)

            expect(JSON.parse(response.body)["username"]).not_to eq(old_username)
        end

        it "deletes current user on DELETE request" do
            delete "/auth", headers: authenticated_header(User.where(username: "rspectest").first)

            expect(User.where(username: "rspectest").first).to eq(nil)
        end
    end

    #   describe "GET /index" do
    #     pending "add some examples (or delete) #{__FILE__}"
    #   end
end
