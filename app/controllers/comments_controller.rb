class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.name = current_user.respond_to?(:name) ? current_user.name : current_user.email

    if @comment.save
      redirect_to post_path(@post, anchor: "comments"), notice: "コメントを投稿しました。"
    else
      @comments = @post.comments.includes(:user).order(created_at: :desc)
      flash.now[:alert] = "コメントの投稿に失敗しました。"
      render "posts/show", status: :unprocessable_entity
    end
  end

  def destroy
    comment = @post.comments.find(params[:id])

    unless comment.user_id == current_user.id || (@post.respond_to?(:user_id) && @post.user_id == current_user.id)
      return redirect_to post_path(@post, anchor: "comments"), alert: "削除権限がありません。"
    end

    comment.destroy
    redirect_to post_path(@post, anchor: "comments"), notice: "コメントを削除しました。"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    # nameはサーバ側で補完するのでpermitしない（任意）
    params.require(:comment).permit(:comment)
  end
end
