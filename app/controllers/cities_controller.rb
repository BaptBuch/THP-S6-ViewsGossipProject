class CitiesController < ApplicationController
  def show
    def show
      @city = City.find(params[:id])
      #@gossips = Gossip.all.where(user_id: params[:id])
      @gossips=[]
      Gossip.all.each {|gossip|
        if gossip.user.city_id == params[:id].to_i
          @gossips.push(gossip)
        end
      }
    end
  end
end
