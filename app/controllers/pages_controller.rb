class PagesController < ApplicationController


  layout 'admin'

  before_action :confirm_user
  before_action :find_subject
  before_action :count_pages ,:only=>['new','edit','create','update']

  def index
    @pages=@subject.pages.sorted
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    @page=Page.new(:subject_id=>@subject.id)
  end

  def create
    @page=Page.new(pages_params)
    @page.subject=@subject
    if @page.save
      flash[:notice]="'#{@page.name}' Created Successfully !!!"
      redirect_to(pages_path(:subject_id=>@subject.id))
    else
      render('new')
    end
  end

  def edit
    @page=Page.find(params[:id])
  end

  def update
    @page=Page.find(params[:id])
    if @page.update_attributes(pages_params)
      flash[:notice]="'#{@page.name}' Updated Successfully !!!"
      redirect_to(page_path(@page.id,:subject_id=>@subject.id))
    else
      render('edit')
    end
  end

  def delete
    @page=Page.find(params[:id])
  end

  def destroy
    @page=Page.find(params[:id])
    @page.destroy
    flash[:notice]="'#{@page.name}' Destroyed Successfully !!!"
    redirect_to(pages_path(:subject_id=>@subject.id))
  end

  private

  def pages_params
    params.require(:page).permit(:subject_id,:permalink,:name,:position,:visible)
  end

  def find_subject
      @subject=Subject.find(params[:subject_id])
  end

  def count_pages
      @page_count=@subject.pages.count
      if params[:action]=='new'||params[:action]=='create'
          @page_count+=1
      end
  end

end
