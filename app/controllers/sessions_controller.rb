class SessionsController < ApplicationController
  before_action :is_authenticated?, only: [:welcome]

  def welcome
  end

  def new
    #code
  end

  def create
    if params[:name] && !params[:name].empty?
      session[:name] = params[:name]
      redirect_to welcome_path
    else
      flash[:message] = 'User could not be found'
      redirect_to login_path
    end
  end

  def destroy
    if !session[:name].nil?
      session.clear
    end
    redirect_to login_path
  end
end
