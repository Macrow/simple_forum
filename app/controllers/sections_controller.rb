class SectionsController < ApplicationController

  load_and_authorize_resource

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @section.save
        format.html { redirect_to(root_path, :notice => 'Section was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to(root_path, :notice => 'Section was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to(root_path) }
    end
  end

end

