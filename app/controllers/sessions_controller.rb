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
      flash.now[:danger] = 'Bienvenue !'
      redirect_to(profile_path)
      
    # redirige où tu veux, avec un flash ou pas

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    #logout
    session.delete(:user_id)
    #mettre un lien dans un bouton (par exemple) qui envoie la méthode delete:
    #<%= link_to "Se déconnecter", session_path(session.id), method: :delete %>
  end
end
