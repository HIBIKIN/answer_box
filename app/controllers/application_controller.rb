class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end

  def set_twitter_client
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Y2c4X637cQBHfx2IJ6UWVxGtb"
      config.consumer_secret     = "fAlNRrnPx2vJ7EAThpSQpBuj3BePpL5st3KgRYPKIwl2bEM86I"
      config.access_token        = "994147378323013632-p8UxTBBKcsMt46E9nKBZ6HLiNjJ1I5G"
      config.access_token_secret = "FAZn2xSRfLWUCo1C7MBvpFzJ50QD4Eis19VTCIHlmM0Fk"
    end
  end
end
