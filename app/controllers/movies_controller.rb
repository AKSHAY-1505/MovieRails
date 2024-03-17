class MoviesController < ApplicationController
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
            redirect_to "/" , flash: { alert: "Movie Added Successfully" }
        else 
            redirect_to "/" , flash: { alert: "Error! Unable to add Movie" }
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
            redirect_to "/" , flash: { alert: "Movie Updated Successfully" }
        else    
            redirect_to "/edit/#{params[:id]}" , flash: { alert: "Error! Unable to Update Movie" }
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to "/" , flash: { alert: "Movie Deleted Successfully" }
    end

    def akshay_params
        params.require(:movie).permit(:name,:director,:cast,:language,:cover)
    end
end