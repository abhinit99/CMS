class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_user
  before_action :count_subjects, :only=>['new','create','edit','update']
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject=Subject.find(params[:id])
  end

  def new
    @subject=Subject.new({:name=>'DEFAULT',:position=>0})
  end

  def create
    @subject=Subject.new(subject_params)
    if @subject.save
      flash[:notice]="Subject created successfully!!!"
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject=Subject.find(params[:id])
  end

  def update
    #####@subject=Subject.new(subject_params)
    @subject=Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice]="Subject updated successfully!!!"
      redirect_to(subject_path(@subject.id))
    else
      render('edit')
    end
  end

  def delete
    @subject=Subject.find(params[:id])
  end

  def destroy
    @subject=Subject.find(params[:id])
    @subject.destroy
    flash[:notice]="Subject #{@subject.name} destroyed successfully!!!"
    redirect_to(subjects_path)
  end

private
def subject_params
  params.require(:subject).permit(:name,:position,:visible)
end
def count_subjects
    @subject_count=Subject.count
    if params[:action]=='new'||params[:action]=='create'
        @subject_count+=1
    end
end
end
