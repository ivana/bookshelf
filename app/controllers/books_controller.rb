class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    # @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @books }
    end
  end

  def search
    # take params, make request to google
    # render results
  end
end
