class MessagesController < ApplicationController
  before_action :authenticate_user
  before_action :set_message, only: %i[show]

  def index
    puts current_user

    @messages = []
    Message.find_by_sender(current_user).order("created_at ASC").each { |message| @messages << message.beautify_message }

    render json: @messages
  end

  def create
    @message = Message.create(message_params)
    if @message.errors.any?
      render json: @message.errors, status: :unprocessable_entity
    else
      render json: @message.beautify_message
    end
  end

  def show
    if @message
      render json: @message.beautify_message
    else
      render json: { error: "Message not found!" }, status: :not_found
    end
  end

  private

  def message_params
    params.permit(:title, :text, :previous_message_id).merge(sender: current_user, recipient: User.find_by(username: params[:recipient]))
  end

  def set_message
    @message = Message.find_by_id(params[:id])
    @message = nil if !(@message.sender == current_user || @message.recipient == current_user)
  end
end
