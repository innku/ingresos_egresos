class TagsController < ApplicationController
  
  def index
    render :json => ActsAsTaggableOn::Tag.pluck(:name)
  end
end