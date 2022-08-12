class UsersController < ApplicationController
    before_action :authenticate_user, except: %i[create login]

    # create new user and return the username and jwt token
    def create
        @user = User.create(user_params)
        if @user.errors.any?
            render json: @user.errors, status: :unprocessable_entity
        else
            auth_token = Knock::AuthToken.new payload: { sub: @user.id }

            render json: { username: @user.username, jwt: auth_token.token }, status: :created #, location: @message
        end
    end

    # login user and return the username and jwt token
    def login
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: { sub: @user.id }

            render json: { username: @user.username, jwt: auth_token.token }, status: 200
        else
            render json: { error: "Either the account does not exist or invalid email or password input(s) made!" }, status: 401
        end
    end

    # return current user details
    def show
        render json: current_user
    end

    # update current user details and return newly generated username (if changed) and jwt
    def update
        current_user.update(user_params)
        if current_user.save
            auth_token = Knock::AuthToken.new payload: { sub: current_user.id }

            render json: { username: current_user.username, jwt: auth_token.token }, status: 200
        else
            render json: { text: "Failed to update account!" }
        end
    end

    # delete user
    def destroy
        current_user.destroy

        render json: { text: "The account has been successfully deleted!" }
    end

    private

    # permit passed params
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
