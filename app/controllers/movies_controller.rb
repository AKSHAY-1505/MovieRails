class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def add
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(akshay_params)
        if @movie.save
            redirect_to "/"
        else 
            redirect_to "/about"
        end
    end

    def about
    end

    def update
        @movie = Movie.find(params[:id])
        Rails.logger.info akshay_params
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to "/"
    end

    def akshay_params
        params.require(:movie).permit(:name,:director,:cast,:language,:cover)
    end
end