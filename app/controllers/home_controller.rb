class HomeController < ApplicationController
  def index
    @sections = Section.includes(:forums => [:last_post => :user]).all
  end
end

