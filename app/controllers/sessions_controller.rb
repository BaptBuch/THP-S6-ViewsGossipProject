class SessionsController < ApplicationController
  def new
    #page de login
    #une view new va juste demander l’e-mail et le mot de passe à l'utilisateur via un formulaire, 
    #ce dernier renvoie vers la méthode create. 
    user = User.new
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Connexion réussie '
      redirect_to(profile_path)
      
    # redirige où tu veux, avec un flash ou pas

    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    #logout
    session.delete(:user_id)
    redirect_to(root_path)
    #mettre un lien dans un bouton (par exemple) qui envoie la méthode delete:
    
  end
end
