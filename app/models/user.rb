class User < ActiveRecord::Base
  has_many :moods, -> { order("date DESC") }
  after_create :confirm_signup

  def confirm_signup
    client = Twilio::REST::Client.new Settings.account_sid, Settings.auth_token
    client.account.messages.create(
      from: Settings.phone_number,
      to: phone_number,
      body: "Gotcha #{name}! Thanks for signing up."
    )
  end

  def create_mood(date, score)
    Mood.create(user_id: id, date: date, score: score)
  end

end
