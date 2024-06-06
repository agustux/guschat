class MessagesController < ApplicationController
  http_basic_authenticate_with name: "gus", password: "gus123"

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    logger.info "HELLO"
    logger.info params
    @message = Message.new(message_params)

    if @message.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def message_params
      params.require(:message).permit(:body)
    end

end
