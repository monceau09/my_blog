class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post, notice: "Bonjour Isac, votre post a bien été enregistré."
    else render 'new', notice: "Oh non, Isac! Je n'ai pas pu enregistré votre post."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "hey! Ton article a été mis à jour avec succès!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
      @post = Post.friendly.find(params[:id])
    end
end
