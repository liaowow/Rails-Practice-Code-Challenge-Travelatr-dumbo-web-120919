class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show, :edit, :update]

    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end

    def create
    end

    def show
        @most_recent = @destination.most_recent
        @avg_age = @destination.average_age
    end


    private

    def find_destination
        @destination = Destination.find(params[:id])
    end

    def destination_params
        params.require(@destination).permit(:name, :country)
    end

end