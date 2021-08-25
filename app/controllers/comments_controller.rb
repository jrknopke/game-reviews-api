class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: Review.all.to_json(:include => :comments)
        else
            render json: {error: "Error"}
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :likes, :review_id)
    end
end