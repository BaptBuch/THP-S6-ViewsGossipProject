class StaticPagesController < ApplicationController
  
  def index
    @gossips = Gossip.all
    @user = User.all
  end

  def contact
  end

  def team
  end

end