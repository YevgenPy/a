class SearchController < ApplicationController

  def search
    if params[:term].nil?
      @posts = []
    else
      @posts = Post.search params[:term]
    end
  end
end
