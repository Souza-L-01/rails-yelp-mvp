class ReviewsController < ApplicationController
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = @restaurant.reviews.build
    end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new(review_params)
        @review.restaurant = @restaurant
        if @review.save
            redirect_to restaurant_path(@restaurant)
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:ratting, :content)
    end

end
