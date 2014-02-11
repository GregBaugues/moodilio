class SMSController < ApplicationController

  def create
    user = User.find_by (phone_number: params[:From])
    if user

    else
      User.create(params[params[:From], params[:Body])
    end

  end

end
