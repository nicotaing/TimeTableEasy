class CampusController < ApplicationController
  
  before_filter :require_user
  
  def index
    @campus = Campus.all
  end
  
  def new
    @campus = Campus.new
  end
  
end
