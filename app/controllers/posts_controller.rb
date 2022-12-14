class PostsController < ApplicationController

  def show

  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path}
      end
    end

  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
