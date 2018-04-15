class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result
    @blogs = @blogs.page(params[:page]).per(10).order(:id)
  end

  def show
  	@blog = Blog.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  	@blog = Blog.find_by(id: params[:id])
    @body = @blog.body
  end

  def new
  	@blog = Blog.new
    @body = @blog.body
    @user = User.find(current_user[:id])

  end

  def create
    @user = User.find(current_user[:id])
  	@blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
  	if @blog.save
      redirect_to user_path(current_user[:id])
    else
      render :new
    end
  end

  def update
    blog = Blog.find_by(id: params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to user_path(current_user[:id])
  end

  private
  def blog_params
  	params.require(:blog).permit(:header, :body, :author,:source, :tag,
      :claim1, :claim2, :basis1, :basis2, :example1, :example2, :book)
  end


end
