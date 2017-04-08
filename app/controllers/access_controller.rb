class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_user ,:except=>[:login,:attempt_login,:logout]

  def menu
      @username=session[:username]
  end

  def login
  end

  def attempt_login
      if params[:username].present? && params[:password].present?
          found_user=AdminUser.where(:username=>params[:username]).first
          if found_user
              authorized_user=found_user.authenticate(params[:password])
          end
      end

      if authorized_user
          session[:id]=authorized_user.id
          session[:username]=authorized_user.username
          flash[:notice]="Successfully Logged In !!!"
          redirect_to(admin_path)
      else
          flash.now[:notice]="Incorrect Username/Password combination !!"
          render('login')
      end
  end

  def logout
      session[:id]=nil
      session[:username]=nil
      flash[:notice]="You have logged out.."
      redirect_to(access_login_path)
  end

  private

  def confirm_user
      unless session[:id]
          flash[:notice]="You must login first.."
          redirect_to(access_login_path)
      end
  end
end
