class StaticPagesController < ApplicationController
  
  def home
    @gossips = Gossip.all
  end

  def welcome_user
    @gossips = Gossip.all
  end

  def gossip_id
    @gossip = Gossip.find(params["gossip_id"])
    @user = User.all #find(@gossip.user_id)
  end

  def user_id
    @user = User.find(params["user_id"])
  end

end