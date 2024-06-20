class Admin::PostsController < AuthenticatedController
  def index
    @pagy, @posts = pagy(Post.all.order(created_at: :desc))
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.account.posts.create(
      post_creation_params
    )
    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_url, notice: "Post succuessfully created" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_update_params)
    respond_to do |format|
      if @post.errors.present?
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to admin_post_url(@post), notice: "Post succuessfully edited" }
        format.json { render :show, status: :ok, location: @post }
      end
    end    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_path, notice: "Post deleted successfully" }
    end
  end

  private

  def post_creation_params
    params.require(:post).permit(
      :title,
      :description,
    )
  end

  def post_update_params
    params.require(:post).permit(
      :id,
      :title,
      :description,
    )
  end
end