class User < ActiveRecord::Base
  after_create :confirm_signup

  def confirm_signup
    client = Twilio::REST::Client.new Settings.account_sid, Settings.auth_token
    client.account.messages.create(
      from: Settings.phone_number,
      to: phone_number,
      body: "Gotcha #{name}! Thanks for signing up."
    )
  end

end
