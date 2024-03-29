class ReviewsController < ApplicationController

    def create
        @review = Review.new(reviewParams)
        @review.movie_id = params[:id]
        @review.user_id = current_user.id

        # puts current_user.id   To find currently Logged in  user's ID

        if @review.save
            redirect_to show_movie_path(params[:id]) , flash: { success: "Review Added Succesfully!"}
        else
            redirect_to show_movie_path(params[:id]) , flash: { danger: "Error: #{@review.errors.full_messages}" }
        end
    end 


    private

    def reviewParams
        params.require(:review).permit(:title,:body,:id)
    end
end