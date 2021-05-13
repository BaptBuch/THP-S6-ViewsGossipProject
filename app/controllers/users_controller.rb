class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      redirect_to(root_path)
    else
      render "new"
      puts @user.errors.messages
    end

  end

  
  def show
    @user = User.find(params[:id])
  end

end
