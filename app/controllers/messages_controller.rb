class MessagesController < ApplicationController
  http_basic_authenticate_with name: "gus", password: "gus123"
  helper_method :prev_day

  def index
    logger.info "date: #{index_date}"
    @messages = Message
      .where(created_at: index_date.beginning_of_day..index_date.end_of_day)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def prev_day
      index_date - 1.day
    end

    def index_date
      begin
        index_params = params.permit(:date)
        if index_params[:date]
          Date.parse index_params[:date]
        else
          Date.today
        end
      rescue Date::Error => e
        raise "invalid date"
      end
    end

    def message_params
      params.require(:message).permit(:body)
    end

end
