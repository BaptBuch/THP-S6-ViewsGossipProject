class CommentsController < ApplicationController
  
  #before_action :find_gossip 
  def new
    # Pour revenir au gossip sur lequel on ajoute un commentaire
    @gossip = Gossip.find(params[:gossip_id]) 
    # Pour ajouter un commentaire
    @comment = Comment.new
  end


  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content], gossip: @gossip)
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Commentaire ajouté !"
      redirect_to gossip_path(@gossip.id)
    else
      render "new"
   end

  end  
  
  # private  
  
  # def find_gossip
  #   @gossip = Gossip.find(params[:gossip_id])
  # end
  
end