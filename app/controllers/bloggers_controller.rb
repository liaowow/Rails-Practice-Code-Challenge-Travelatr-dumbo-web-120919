class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit, :update]

    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger.id)
        else
            flash[:errors] = @blogger.errors.full_messages
            redirect_to new_blogger_path
        end

    end

    def show
        @total = @blogger.total_likes
        @feature_post = @blogger.feature_post 
    end


    private

    def find_blogger
        @blogger = Blogger.find(params[:id])
    end

    def blogger_params
        params.require(@blogger).permit(:name, :bio, :age)
    end

end