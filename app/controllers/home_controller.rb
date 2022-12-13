class HomeController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      p 'saved'
    else
      p 'not saved'
    end

  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
