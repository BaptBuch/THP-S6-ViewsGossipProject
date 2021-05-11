class StaticPagesController < ApplicationController
  
  def index
    @gossips = Gossip.all
    @user = User.all
  end

end