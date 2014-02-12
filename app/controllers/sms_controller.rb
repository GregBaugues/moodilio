class SmsController < ApplicationController

  def incoming
    user = User.find_by(phone_number: params['From'])
    if user.present?
      score = params['Body'].strip.chars.first.to_i
      if (1..5).include?(score)
        if user.create_mood(score)
          user.mood_message(score)
        else
          user.text_error
        end
      else
        user.text_error
      end
    else
      @user = User.create(phone_number: params['From'], name: params['Body'])
      @user.confirm_signup
      render :empty_response, layout: false
    end
  end

end
