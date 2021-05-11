class GossipsController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
    @user = User.all #find(@gossip.user_id)
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new
    @gossip.title = params[:title]
    @gossip.content = params[:content]
    @gossip.user_id = 21
    @gossip.user.first_name = "anonymous"

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to(@gossip)
    else
      render "new"
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end