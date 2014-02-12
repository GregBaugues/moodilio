class UsersController < ApplicationController

  def index
    @days = (0..6).collect { |i| (Date.today - i.days) }
    @users = User.all
  end

end
