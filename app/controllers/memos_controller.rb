class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def create
    Memo.create(memo_params)
    redirect_to root_path
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def destroy
    Memo.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def memo_params
    params.require(:memo).permit(:content)
  end

end