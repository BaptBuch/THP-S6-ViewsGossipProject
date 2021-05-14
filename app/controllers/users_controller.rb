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
    @user.description = params[:description]
    @user.city_id = params[:city]
    @user.age = params[:age]
    
    if @user.save
      log_in(@user)
      session[:user_id] = @user.id
      redirect_to(profile_index_path)
    
    else
      render "new"
      puts "erreur"
      
    end

  end

  
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(root_path)
  end

end