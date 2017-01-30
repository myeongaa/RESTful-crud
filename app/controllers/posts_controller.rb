class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def create
        @title = params[:title]
        @content = params[:content]
        
        post = Post.new
        post.title = @title
        post.content = @content
        post.save
        
        redirect_to "/posts"
    end
    
    def new
    
    end
    
    def edit
        @post_id = params[:id]
        @post = Post.find_by_id(@post_id)
    end
    
    def show
        @post_id = params[:id]
        @post = Post.find_by_id(@post_id)
    end
    
    def update
        @title = params[:title]
        @content = params[:content]
        
        post = Post.find_by_id(params[:id])
        post.title = @title
        post.content = @content
        post.save
        
        redirect_to post_path(params[:id])
    end
    
    def destroy
        @post_id = params[:id]
        @post = Post.find_by_id(@post_id).destroy
        
        redirect_to "/posts"
    end
end
