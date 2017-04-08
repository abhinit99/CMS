class DemoController < ApplicationController

  layout 'admin'

  def index
    render('index')
  end

  def hello
    @id=params[:id]
    @page=params['page']
    render('hello')
  end

  def new_hello
    redirect_to(:controller =>'demo',:action =>'hello')
  end

  def youtube
    redirect_to('http://youtube.com')
  end
end
