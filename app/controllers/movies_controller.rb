class MoviesController < ApplicationController
    before_action :is_root , only: [:edit,:create,:add,:update,:destroy]
    def index
        @movies = Movie.all
    end

    def add
        @movie = Movie.new
    end

    def show
        @movie = Movie.find(params[:id])
        @review = Review.new
        @reviews = Review.where(movie_id:@movie.id)
    end

    def create
        @movie = Movie.new(akshay_params)
        if @movie.save
            redirect_to root_path , flash: { alert: "Movie Added Successfully" }
        else 
            redirect_to root_path , flash: { alert: "Error! Unable to add Movie" }
        end
    end

    def about
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(akshay_params)
            redirect_to root_path , flash: { alert: "Movie Updated Successfully" }
        else    
            redirect_to edit_movie_path(@movie) , flash: { alert: "Error! Unable to Update Movie" }
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to root_path , flash: { alert: "Movie Deleted Successfully" }
    end

    def akshay_params
        params.require(:movie).permit(:name,:director,:cast,:language,:cover)
    end
end