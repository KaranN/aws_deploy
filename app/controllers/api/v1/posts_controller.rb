class Api::V1::PostsController < API::V1::ApiController
  before_action :set_post, only: [:show]
  def index
    @posts = Post.all
    render
  end

  def show
    render
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end