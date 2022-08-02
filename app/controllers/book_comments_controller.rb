class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = book.id
    @comment.save
    #redirect_back(fallback_location: root_path)
    render "create"
  end

  def destroy
    BookComment.find(params[:id]).destroy
    #redirect_back(fallback_location: root_path)
    @book = Book.find(params[:book_id])
    @user = @book.user
    @comment = BookComment.new
    render "destroy"
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
