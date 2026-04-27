class MemosController < ApplicationController
  def index
    @memos = Current.user.memos
    @memo = Memo.new
  end

  def create
    Current.user.memos.create(memo_params)
    redirect_to root_path
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to root_path, notice: "Memo updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
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