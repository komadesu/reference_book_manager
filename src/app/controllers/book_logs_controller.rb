class BookLogsController < ApplicationController
  def index
  end

  def new
    @book_log = BookLog.new
  end

  def create
    book_log = BookLog.new(book_log_params)
    if book_log.save
      redirect_to book_log
    else
      flash.now[:error] = 'データの登録に失敗しました'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_log_params
    params.require(:book_log).permit(:title, :author, :status, :score, :summary)
  end

end
