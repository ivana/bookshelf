class SearchController < ApplicationController

  def index
    @books = GoogleBook.search params[:q]

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @books }
    end

  end

end
