class SessionsController < ApplicationController

  def create
      @user = User.find_by(name: params[:name])
      if @user.try(authenticate: params[:password])
        binding.pry
        session[:user_id] = @user.id
      else
        redirect_to login_path
      end
  end

end
