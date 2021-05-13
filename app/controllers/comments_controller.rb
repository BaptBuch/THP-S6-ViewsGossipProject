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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.user = current_user
    
    if @comment.update(content: params[:content])  
      flash[:success] = "Commentaire modifié !"
      redirect_to gossip_path(@gossip.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    
    
    @comment.destroy
    flash[:success] = "Commentaire supprimé !"
    redirect_to gossip_path(@gossip.id)
  end
  
end