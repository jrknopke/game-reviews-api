class CommentsController < ApplicationController
    def create
        commment = Comment.new(comment_params)
        if review.save
            render json: Review.all.to_json(:include => :comments)
        else
            render json: {error: "Error"}
        end
    end
end
