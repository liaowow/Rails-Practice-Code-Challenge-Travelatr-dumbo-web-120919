class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :add_like]
    before_action :foreign_keys, only: [:new, :edit]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)

        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def show
        @blogger = @post.blogger
        @destination = @post.destination
    end

    def edit
    end

    def update
    end

    def add_like
        @post.likes += 1
        @post.save
        redirect_to post_path(@post)
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(@post).permit(:title, :content, :likes)
    end

    def foreign_keys
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

end