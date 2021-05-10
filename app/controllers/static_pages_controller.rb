class StaticPagesController < ApplicationController
  
  def home
    @gossips = Gossip.all
  end

  def welcome_user
    @gossips = Gossip.all
  end

  def gossip_id
    @gossip = Gossip.find(params["gossip_id"])
    @user = User.all
  end

  def user_id
    @user = User.find(params["user_id"])
  end

end


#     @user = User.new
#     @user.first_name = params["first_name"]
#     @user.save
#     puts "$" * 60 #ça affiche une ligne de 60 symboles $ facilement visible dans le terminal
#     puts @user.first_name #tu sais que params doit s'afficher entre les 2
#     puts "$" * 60