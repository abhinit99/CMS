class PublicController < ApplicationController


    before_action :set_subject
    layout 'public'
  def index

  end

  def show
      @page=Page.visible.where(:permalink=>params[:permalink]).first
      if @page.nil?
          redirect_to(root_path)
      end
  end

  private
  def set_subject
      @subjects=Subject.visible
  end
end
