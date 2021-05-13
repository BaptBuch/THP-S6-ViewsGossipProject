class GossipsController < ApplicationController
  
  before_action :verify_connection, only: [:new, :create, :show]
  before_action :gossip_creator, only: [:edit, :update, :destroy]
  
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
    # @user = User.all #find(@gossip.user_id)
  end

  def new
    @gossip = Gossip.new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.new
    @gossip.title = params[:title]
    @gossip.content = params[:content]
    @gossip.user = current_user

    if @gossip.save
      flash[:success] = "Gossip sauvegardé."
      redirect_to(root_path)
    else
      render "new"
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      flash[:success] = "Gossip mis à jour."
      redirect_to(@gossip)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to(root_path)
  end

  private

  def verify_connection
    unless current_user
      flash[:info] = "Please log in."
      redirect_to new_session_path
    end
  end

  def gossip_creator
    @gossip = Gossip.find(params[:id])
    unless @gossip.user_id == current_user.id
      flash[:danger] = "Seul le créateur du potin peut supprimer un potin."
      redirect_to gossip_path
    end
  end

end
