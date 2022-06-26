class PagesController < ApplicationController
  def home
    @comments = Comment.lastComments
    @posts = Post.lastPosts
    @likes = Like.lastLikes
  end
end
