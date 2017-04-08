class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private

  def confirm_user
      unless session[:id]
          flash[:notice]="You must login first.."
          redirect_to(access_login_path)
      end
  end
end
