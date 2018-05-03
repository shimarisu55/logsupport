class FavoritesController < ApplicationController
   # before_action :authenticate_user!, except: [:index,:show]
        def create
            @blog = Blog.find(params[:blog_id])
            favorite = current_user.favorites.build(blog_id: @blog.id)
            favorite.save
        end
        def destroy
            @blog = Blog.find(params[:blog_id])
            favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
            favorite.destroy
        end

        def show
            @blog = Blog.find(params[:blog_id])
        end
        def index
            @user = User.find(params[:user_id])
            @favorites = @user.favorites.page(params[:page])
        end
end
