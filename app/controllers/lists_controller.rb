class ListsController < ApplicationController
    def index
        @my_lists = List.where(user_id: current_user.id)
        @list = List.new
    end

    def create 
        @list = List.new(listParams)
        @list.user_id = current_user.id

        if @list.save
            redirect_to "/list/index" , flash: {alert: "List Created Succesfully"}
        else
            redirect_to "/list/index" , flash: {alret: "Error: #{@list.errors.full_messages}"}
        end
    end

    def add
        List.find(params[:lists]).movies << Movie.find(params[:movie_id])
        redirect_to "/" , flash: {alert: "Movie Added to #{List.find(params[:lists]).name} List Succesfully"}
    end

    private

    def listParams
        params.require(:list).permit(:name)
    end
end