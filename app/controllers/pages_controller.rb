# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @comments = Comment.lastComments
    @posts = Post.lastPosts
    @likes = Like.lastLikes
  end
end
