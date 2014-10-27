class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , :except => [:show, :index]
  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created.!!!"
    else
      render('new')
    end
    respond_with(@post)
  end

  def update
    result = @post.update(post_params)
    if result
      flash[:notice] = "Post updated.!!!"
    else
      render('edit')
    end
    respond_with(@post)
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post Deleted.!!!"
    else
      flash[:error] = "Err.. Error in deleting post.!!!"
    end
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
