class BookLogsController < ApplicationController
  def index
    @book_logs = BookLog.all
  end

  def new
    @book_log = BookLog.new
  end

  def create
    @book_log = BookLog.new(book_log_params)
    if @book_log.save
      redirect_to book_logs_path, notice: 'データが正常に作成されました'
    else
      flash.now[:errors] = @book_log.errors.full_messages
      render 'new'
    end
  end

  def show
    @book_log = BookLog.find(params[:id])
  end

  def edit
    @book_log = BookLog.find(params[:id])
  end

  def update
    @book_log = BookLog.find(params[:id])
    if @book_log.update(book_log_params)
      redirect_to @book_log, notice: 'データが正常に編集されました'
    else
      flash.now[:errors] = @book_log.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    book_log = BookLog.find(params[:id])
    book_log.destroy
    redirect_to book_logs_path, alert: "id:#{book_log.id}の参考書データを一件削除しました"
  end

  private

  def book_log_params
    params.require(:book_log).permit(:title, :author, :status, :score, :summary)
  end

end
