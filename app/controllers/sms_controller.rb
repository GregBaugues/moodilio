class SmsController < ApplicationController

  def incoming
    user = User.find_by(phone_number: params['From'])
    if user

    else
      @user = User.create(phone_number: params['From'], name: params['Body'])
      render :empty_response, layout: false
    end
  end

end
