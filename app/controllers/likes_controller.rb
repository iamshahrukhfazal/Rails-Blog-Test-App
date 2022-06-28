# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @report = Report.new
    @post = current_user.likes.new(like_params)
    respond_to do |format|
      if @post.save
        @like_class = (@post.likeable.class.to_s).eql? 'Comment'
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    @report = Report.new
    @post = current_user.likes.find(params[:id])
    @like_class = (@post.likeable.class.to_s).eql? 'Comment'
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.js
    end
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
