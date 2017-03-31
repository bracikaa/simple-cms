class DemoController < ApplicationController

  layout false

  def index
  	render('index')
  end

  def hello
  	#how to provide template
  	#either with hash
  	#render(:template => 'demo/hello')
  	#render('demo/hello')
  	#@instance_variables
  	#template will have access
  	@array = [1, 2, 3, 4, 5]
  	@id = params['id']
  	@page = params[:page]
  	render('hello') 
  end

  def other_hello
  	#redirect 
  	#redirect_to(:controller => 'demo', :action => 'index')
  	#sends user to new location
  	redirect_to(:action => 'index')

  end

  def google
  	redirect_to('http://www.google.com')
  end
end
