# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]

  # GET /posts or /posts.json
  def index
    authorize Post
    # @page_post = Post.paginate(page: params[:page], per_page: 3)
    @posts = Post.all
    @post = Post.new
    @suggestion = Suggestion.new
  end

  # GET /posts/1 or /posts/1.json
  def show
    authorize Post
    @post = Post.find(params[:id])
    @report = Report.new
    @suggestion = Suggestion.new
    @comment = Comment.new
    authorize Post
  end

  # GET /posts/new
  def new
    authorize Post
    @post = Post.new
    @post.user = current_user
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge!(status: 'unpublished'))
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }

      end

      format.js
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :links, :status)
  end
end
