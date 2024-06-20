class FeedsController < AuthenticatedController
  def show
    @pagy, @posts = pagy(Post.all.order(created_at: :desc))
  end
end
