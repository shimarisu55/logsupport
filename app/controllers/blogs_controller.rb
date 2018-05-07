class BlogsController < ApplicationController
  # before_action :authenticate_user!, except: [:index,:show]

  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result
    # @blogs = @blogs.page(params[:page]).per(24).order(:id)
  end

  def show
  	@blog = Blog.find(params[:id])
    @post_comment = PostComment.new
    @blog_option = Blog.find_by(user_id:@blog.user_id,author:@blog.author,source:@blog.source,book:@blog.book,tag:"意見文")
    @blog_resume = Blog.find_by(user_id:@blog.user_id,author:@blog.author,source:@blog.source,book:@blog.book,tag:"要約文")
  end

  def edit
  	@blog = Blog.find_by(id: params[:id])
    @user = User.find(current_user[:id])
    @blog.group_id = nil
  end

  def new
  	@blog = Blog.new(user_id:params[:id],author:params[:author],source:params[:source],book:params[:book],tag:params[:tag])
    @user = User.find(current_user[:id])

  end

  def create
    Blog.create!(blog_params)
    redirect_to user_path(current_user[:id])
  end

  def confirm
    @blog = Blog.new(blog_params)
    @user = User.find(current_user[:id])
    @blog.user_id = current_user.id
    if @blog.valid?
      render :action => 'confirm'
    else
      render :action => 'new'
    end
  end
  
  def back
    @blog = Blog.new(blog_params)
    @user = User.find(current_user[:id])
    @blog.user_id = current_user.id
    render :new
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
  	params.require(:blog).permit(:user_id, :header, :body, :author,:source, :book, :tag,
      :claim1, :claim2, :basis1, :basis2, :example1, :example2, :group_id)
  end

end
