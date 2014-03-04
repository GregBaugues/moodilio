class CallController < ApplicationController

  def outgoing
    user = User.find(params[:user_id])
    if user.present?
      client = Twilio::REST::Client.new Settings.account_sid, Settings.auth_token
      # call = client.account.calls.create(
      #   :from => Settings.phone_number,
      #   :to => Settings.admin_phone_number,
      #   :url => "#{Settings.callback_base_url}/connect?user_id=#{user.id}"
      # )
      #render :empty_response, layout: false
      flash[:notice] = "Calling #{user.name}..."
      redirect_to users_path
    end
  end

  def connect
    @user = User.find(params[:user_id])
    render :connect, layout: false
  end

end
