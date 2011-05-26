class PostsController < ApplicationController

  load_and_authorize_resource

  before_filter :find_topic, :only => [:new, :create]

  def new
  end

  def edit
  end

  def create
    @post = @topic.posts.build(params[:post])
    @post.user = current_user
    @post.forum_id = @topic.forum_id
    @post.save
    respond_to do |format|
      format.js
    end
  end


  def update
    @post.update_attributes(params[:post])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post.topic }
      format.js
    end
  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end

