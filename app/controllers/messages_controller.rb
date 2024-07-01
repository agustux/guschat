class MessagesController < ApplicationController
  helper_method :next_week, :next_day, :prev_day, :prev_week, :index_date

  before_action :authenticate, :timezone

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      @username = username
      logger.info "username: #{@username}"
      User.find_by(username: @username)&.authenticate(password)
    end
  end

  def timezone
    min = request.cookies["time_zone"].to_i
    @timezone = ActiveSupport::TimeZone[-min.minutes]
    logger.info "timezone: #{@timezone}"
  end

  def index
    logger.info "date: #{index_date}"
    @messages = Message
      .where(created_at: index_date.beginning_of_day..index_date.end_of_day)
  end

  def new
    @message = Message.new
  end

  def create
    args = message_params
    args['username'] = @username
    logger.info "creating message: #{args}"
    @message = Message.new(args)

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

    def prev_week
      index_date - 7.day
    end

    def next_day
      index_date + 1.day
    end

    def next_week
      index_date + 7.day
    end

    def index_date
      begin
        index_params = params.permit(:date)
        if index_params[:date]
          d = Date.parse index_params[:date]
        else
          d = Date.today
        end
        d.in_time_zone(@timezone)
      rescue Date::Error => e
        raise "invalid date"
      end
    end

    def message_params
      params.require(:message).permit(:body)
    end

end
