class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    Memo.create(text: params[:text])
    redirect_to root_path
  end

  def destroy
    Memo.find(params[:id]).destroy
    #redirect_to root_path
  end

end
