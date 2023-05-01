class CommentsController < ApplicationController
  def create
    @book = Book.find_by(id: params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.book_id = @book.id
    @comment.save
  end

  def destroy
    @book = Book.find_by(id: params[:book_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
