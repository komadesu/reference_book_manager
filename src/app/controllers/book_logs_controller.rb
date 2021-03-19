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
      flash.now[:errors] = book_log.errors.full_messages
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
    params.permit(:title, :author, :status, :score, :summary)
  end

end
