class UsersController < ApplicationController
  before_action :authenticate_user, except: %i[create sign_in]

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      render json: @user.errors, status: :unprocessable_entity
    else
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }

      render json: { username: @user.username, jwt: auth_token.token }, status: :created #, location: @message
    end
  end

  def sign_in
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      auth_token = Knock::AuthToken.new payload: { sub: @user.id }

      render json: { username: @user.username, jwt: auth_token.token }, status: 200
    else
      render json: { error: "Either the account does not exist or invalid email or password input(s) made!" }
    end
  end

  def update
    current_user.update(user_params)
    if current_user.save
      render json: { text: "The account has been successfully updated!" }
    else
      render json: { text: "Failed to update account!" }
    end
  end

  def destroy
    current_user.destroy

    render json: { text: "The account has been successfully deleted!" }
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
