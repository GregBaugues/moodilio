class User < ActiveRecord::Base
  has_many :moods, dependent: :destroy
  after_create :backfill_moods

  def confirm_signup
    client = Twilio::REST::Client.new Settings.account_sid, Settings.auth_token
    client.account.messages.create(
      from: Settings.phone_number,
      to: phone_number,
      body: "Hi #{name}! Thanks for signing up."
    )
  end

  def create_mood(score, date = Date.today)
    Mood.create(user_id: id, date: date, score: score)
  end

  def backfill_moods
    #don't fill today
    modifier = [-2, 0, 2].sample
    (1..6).collect do |i|
      date = Date.today - i.days
      score = (1..5).to_a.sample + modifier
      score += 1 if score == 0
      score -= 1 if score == 6
      create_mood(score, date)
    end
  end

  def text(body)
    client = Twilio::REST::Client.new Settings.account_sid, Settings.auth_token
    client.account.messages.create(
      from: Settings.phone_number,
      to: phone_number,
      body: body
    )
  end

  def ping
    text "On a scale of 1 to 5, how are you feeling?"
  end

  def text_error
    text "Sorry, I didn't get that. On a scale of 1 to 5, how are you feeling?"
  end

  def mood_message(score)
    if score >= 4
      text "Glad you're having a good day!"
    elsif score >= 3
      text "Thanks for letting me know you're doing okay."
    elsif score >0
      text "I'm sorry that you're not feeling well."
    end
  end

end
