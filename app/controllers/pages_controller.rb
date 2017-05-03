class PagesController < ApplicationController

  layout 'admin'
  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:new, :create, :edit, :update]
  
  def index
    @pages = Page.sorted
  end

  def show 
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    #@page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
      #save the object
      if @page.save!
        flash[:notice] = "Page created succesfully."
        redirect_to pages_path 
      else
      #  @page_count = Page.count + 1
        render('new')
      end
    end

    def edit
      @page = Page.find(params[:id])
      #@page_count = Page.count
    end

    def update
      @page = Page.find(params[:id])
      #update the object
      if @page.update_attributes(page_params)
        flash[:notice] = "Subject updated succesfully."
        redirect_to page_path(@page) 
      else
      #if not redisplay the for  else
      #@page_count = Page.count
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed succesfully."
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_page_count 
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
  end
end
end
