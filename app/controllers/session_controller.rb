class SessionController < ApplicationController
  def index
  end

  def login
    @user = User.find_by_Username_and_password params[:username_field], params[:password_field]
    if @user.nil?
      puts "yeska"
      flash[:status] = "Incorrect Password. Try again."
      redirect_to root_path
    else
      puts "noka"
      session[:currUserID] = @user.id
      puts @user.id
      flash[:status] = "You have successfully logged in!"
      redirect_to users_url
    end
  end

  def logout
  end
end