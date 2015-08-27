module Citygram::Routes
  class Analytics < Citygram::App
    helpers Citygram::Routes::Helpers

    get '/analytics' do
      @email_subscriptions_count = Subscription.email.count
      @sms_subscriptions_count = Subscription.sms.count

      erb :analytics
    end
  end
end
