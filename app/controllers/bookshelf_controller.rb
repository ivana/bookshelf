class BookshelfController < ApplicationController

  def index
    # if user.logged_in?
      render 'users/recent' # or probably usersbooks/recent
    # else
    #   render welcome
    # end
  end

end