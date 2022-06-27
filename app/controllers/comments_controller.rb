# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @report = Report.new
    byebug

    @comment = current_user.comments.new(comment_params)
    byebug
    respond_to do |format|
      if @comment.save
        @post = @comment.post
        format.html { redirect_to post_path(params[:post_id]), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comments).permit(:content, :parent_id)
          .merge(post_id: params[:post_id])
    byebug
  end
end
