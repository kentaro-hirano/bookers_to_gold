class PostCommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        comment = current_user.post_comments.new(post_comment_params)
        comment.book_id = book.id
        if comment.save
        flash[:notice] = "Comment was successfully created."
        redirect_to book_path(book)
        else
        flash[:notice] = "Comment can't be blank."
        redirect_to book_path(book)
        end
    end

    def destroy
        book = Book.find(params[:book_id])
        post_comment = current_user.post_comments.find_by(book_id: book.id)
        post_comment.destroy
        flash[:notice] = "Comment was successfully deleted."
        redirect_to book_path(params[:book_id])  
    end

    private
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end
