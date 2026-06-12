class LikesController < ApplicationController
  def create
    @memo = Memo.find(params[:memo_id])
    @memo.likes.create(user: Current.user)
    redirect_to memos_path
  end

  def destroy
    @memo = Memo.find(params[:memo_id])
    like = @memo.likes.find_by(user: Current.user)
    like.destroy
    redirect_to memos_path
  end
end
