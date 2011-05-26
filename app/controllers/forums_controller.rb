class ForumsController < ApplicationController
  before_filter :find_section, :only => [:new, :create]

  load_and_authorize_resource

  def show
    @topics = @forum.topics.includes(:user, :last_post => :user).order("id DESC").page params[:page]
    respond_to do |format|
      format.html
    end
  end

  def new
    @forum = @section.forums.build

    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @forum = @section.forums.build(params[:forum])
    respond_to do |format|
      if @forum.save
        format.html { redirect_to(root_path, :notice => 'Forum was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        format.html { redirect_to(root_path, :notice => 'Forum was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy

    @forum.destroy

    respond_to do |format|
      format.html { redirect_to(forums_url) }
    end
  end

  private

  def find_section
    @section = Section.find(params[:section_id])
  end
end

