class SubjectsController < ApplicationController

  layout 'admin'
  
  def index
    #find subjects
    @subjects = Subject.sorted
  end

  def show 
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    #instantiate the object
    #mass assignment - params.require(:controller).permit(:action1, :action2)
    @subject = Subject.new(subject_params)
    #save the object
    if @subject.save
    #if succeeds go back to index
    flash[:notice] = "Subject created succesfully."
    redirect_to subjects_path 
    #if not redisplay the form
  else
    @subject_count = Subject.count + 1
    render('new')
    end
  end

  def edit
     @subject = Subject.find(params[:id])
     @subject_count = Subject.count
  end

  def update
    #instantiate the object
    #mass assignment - params.require(:controller).permit(:action1, :action2)
    @subject = Subject.find(params[:id])
    #update the object
    if @subject.update_attributes(subject_params)
    #if succeeds redirect to show
    flash[:notice] = "Subject updated succesfully."
    redirect_to subject_path(@subject) 
    #if not redisplay the form
  else
    @subject_count = Subject.count
    render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
      @subject = Subject.find(params[:id])
      @subject.destroy
      flash[:notice] = "Subject '#{@subject.name}' destoyed succesfully."
      redirect_to(subjects_path)
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end
end
