class SmsController < ApplicationController

  def incoming
    user = User.find_by(phone_number: params['From'])
    if user.present?
      check_input(user, params)
    else
      new_user(params)
    end
    render :empty_response, layout: false
  end

  def new_user(params)
    user = User.create(phone_number: params['From'], name: params['Body'])
    user.confirm_signup
  end

  def check_input(user, params)
    body = params['Body'].strip.chars.first.to_i
    if (1..5).include?(body)
      score = body
      user.create_mood(score)
      user.mood_message(score)
    else
      user.text_error
    end
  end

end
