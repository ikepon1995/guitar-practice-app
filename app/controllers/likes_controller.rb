class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    current_user.likes.find_or_create_by!(post: @post)
    redirect_to post_path(@post, anchor: "like"), notice: "いいねしました。"
  end

  def destroy
    current_user.likes.where(post: @post).destroy_all
    redirect_to post_path(@post, anchor: "like"), notice: "いいねを外しました。"
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
