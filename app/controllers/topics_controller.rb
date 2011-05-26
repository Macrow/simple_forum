class TopicsController < ApplicationController

  load_and_authorize_resource

  before_filter :find_forum, :only => [:new, :create]

  def show
    @topic.browse_once
    @posts = @topic.posts.includes(:forum, :user => :roles).page params[:page]
    @post = Post.new
    respond_to do |format|
      format.html
    end
  end

  def new
    @topic = @forum.topics.build
    respond_to do |format|
      format.html
    end
  end

  def edit

  end


  def create
    @topic = @forum.topics.build(params[:topic])
    @topic.user = current_user

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @forum, notice: 'Topic was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to @topic.forum }
    end
  end

  private

  def find_forum
    @forum = Forum.find(params[:forum_id])
  end
end

