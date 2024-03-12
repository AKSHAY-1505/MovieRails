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

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(akshay_params)
            redirect_to "/"
        else    
            redirect_to "/edit/#{params[:id]}"
        end
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