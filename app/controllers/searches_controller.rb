class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @content = params[:content]

    if @range == "User"
      @users = User.looks(params[:search], params[:content])
    else
      @books = Book.looks(params[:search], params[:content])
    end
  end
end
