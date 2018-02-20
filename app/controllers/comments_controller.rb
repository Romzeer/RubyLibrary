class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @book = Book.find(params[:article_id])
    @comment = @book.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
        redirect_to article_path(@book)
      else
        flash.now[:danger] = "error"
      end
  end

  def edit
    @book = Book.find(params[:article_id])
    @comment = @book.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment.article
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:article_id])
    @comment = @book.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@book)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end