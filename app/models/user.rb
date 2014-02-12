class User < ActiveRecord::Base
  has_many :moods, dependent: :destroy
  after_create :confirm_signup
  after_create :backfill_moods

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

  def backfill_moods
    modifier = [-1, 0, 1].sample
    (0..6).collect do |i|
      date = Date.today - i.days
      score = (1..5).to_a.sample + modifier
      score += 1 if score == 0
      score -= 1 if score == 6
      create_mood(date, score)
    end
  end

end
