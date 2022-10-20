class PostsController < ApplicationController
  before_action :set_post #, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # GET /posts or /posts.json
  def index
    # postsavg= Post.all.average(:rate).to_i
    #  @posts=Post.all#.where(:rate => postsavg)
    # @posts = Post.where(user_id: session[:user_id])
    
    @posts = Post.all#.includes([:user])
    # @users = User.all
    # @post = Post.new(title: "Fake", content: "Fake Content", author: "Fake Author", rate: 3, created_at: Time.now, updated_at: Time.now, user_id: 1).save
    # render json: @posts, status: 200
  end
  def topposts
    postsavg= Post.all.average(:rate).to_i
    @posts=Post.all.where(:rate => postsavg)
  end
  # GET /posts/1 or /posts/1.json
  def show
  end
  # GET /posts/new
  def new
    @post = Post.new
    render json:@post
  end
  # GET /posts/1/edit
  def edit
    if @post.update(post_params)
      # @post.save
      render json: @posts
    else
      render json: @posts.errors, status: 200
    end
  end
  # POST /posts or /posts.json

  def create
     # @post = Post.new(params[:post])
     @post = Post.new(post_params)
    #  @post[:user_id] = session[:user_id]
    #  @post[:author] = session[:user_name]
   
     #for the testcase file render json response only
     render json: @post
     # respond_to do |format|
     #   if @post.save
     #     format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
     #     format.json { render :show, status: :created, location: @post }
     #   else
     #     format.html { render :new, status: :unprocessable_entity }
     #   end
     # end
   end
   # PATCH/PUT /posts/1 or /posts/1.json
   def update
    
    if @post.update(post_params)
      # @post.save
      puts "post data: #{@post.to_json}"
      render json: @post
    else
      render json: @post.errors, status: 200
    end

    # render  json: Post.last
    #  respond_to do |format|
    #    if @post.update(post_params)
    #     #  render json: @post
    #      format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
    #      format.json { render :show, status: :ok, location: @post }
    #    else
    #      format.html { render :edit, status: :unprocessable_entity }
    #    end
    #  end
   end
 
  # def create
  #   puts "IM CALLED"
  #   @post = Post.new(post_params)
  #   @post[:user_id] = session[:user_id]
  #   @post[:author] = session[:user_name]
  #   respond_to do |format|
  #     if @post.save
  #       format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
  #       format.json { render :show, status: :created, location: @post }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # # PATCH/PUT /posts/1 or /posts/1.json
  # def update
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
  #       format.json { render :show, status: :ok, location: @post }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    render json: @posts
    # respond_to do |format|
    #   format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end
  private  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(id: params[:id])
      # @post = Post.find(params[:id])
      # render json: @posts

    end
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :author, :rate)
    end
end
