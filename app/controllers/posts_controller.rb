class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      p 'saved'
    else
      debugger
      p 'not saved'
    end

  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
