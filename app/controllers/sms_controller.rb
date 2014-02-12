class SmsController < ApplicationController

  def incoming
    render :json => {text: 'hello'}
  end

end
