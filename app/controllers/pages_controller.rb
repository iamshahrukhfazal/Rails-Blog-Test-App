# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @comments = Comment.last_comments
    @posts = Post.last_posts
    @likes = Like.last_likes
  end

  def user_profile
    @likes = current_user.likes.count
    @comments = current_user.comments.count
    @posts = current_user.posts.count
  end
end
