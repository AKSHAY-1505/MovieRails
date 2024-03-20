class MoviesController < ApplicationController
    before_action :root_only , only: [:edit,:create,:add,:update,:destroy]
    before_action :get_movie , only: [:show,:edit,:update,:destroy]

    def index
        @movies = Movie.all
    end

    def add
        @movie = Movie.new
    end

    def show
        # @movie = Movie.find(params[:id])
        @review = Review.new
        @reviews = Review.where(movie_id:@movie.id)
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to root_path , flash: { success: "Movie Added Successfully" }
        else 
            redirect_to root_path , flash: { danger: "Error! Unable to add Movie" }
        end
    end

    def about
    end

    def edit
        # @movie = Movie.find(params[:id])
    end

    def update
        # @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            redirect_to root_path , flash: { success: "Movie Updated Successfully" }
        else    
            redirect_to edit_movie_path(@movie) , flash: { danger: "Error! Unable to Update Movie" }
        end
    end

    def destroy
        # @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to root_path , flash: { success: "Movie Deleted Successfully" }
    end

    private

    def movie_params
        params.require(:movie).permit(:name,:director,:cast,:language,:cover)
    end

    def get_movie
        @movie = Movie.find(params[:id])
    end
end