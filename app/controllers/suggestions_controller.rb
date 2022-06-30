# frozen_string_literal: true

class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[index]
  before_action :set_all_suggestion, only:%i[udpate]
  before_action :set_suggestion, only:%i[destroy]


  def show
    authorize Suggestion
    @my_suggestion = Suggestion.my_suggestions(current_user.id)
  end

  def index
    authorize Suggestion
    @suggestions = @post.suggestions
    @is_user_post = (@post.user.id).eql? current_user.id
  end

  def create
    authorize Suggestion
    @suggestion = current_user.suggestions.new(suggestion_params)
    respond_to do |format|
      if @suggestion.save
        @post = @suggestion.post
        format.html { redirect_to post_path(params[:post_id]), notice: 'Comment was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def update
    authorize Suggestion
    @suggestion = Suggestion.find(params[:id])
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to post_url(@suggestion), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def destroy
    @suggestion = current_user.suggestions.find(params[:id])
    @post_suggestion = @suggestion
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  def set_all_suggestion
    @suggestion = Suggestion.find(params[:id])

  end
  def set_suggestion
    @suggestion = current_user.suggestions.find(params[:id])

  end


  def set_post
    @post = Post.find(params[:post_id])
  end

  def suggestion_params
    if params[:post_id].nil?
      params.require(:suggestion).permit(:status, :content, :id, :message)
    else
      params.require(:suggestion).permit(:status, :content, :id, :message)
            .merge(post_id: params[:post_id])
    end
  end
end
