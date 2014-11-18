class BooksController < ApplicationController


  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:name, :author, :description, :rank))
      redirect_to root_path
    else
      render :edit
    end
  end

  def details
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.all.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params.require(:book).permit(:name, :author, :description, :rank))
    # raise params.inspect
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def upvote
    @book = Book.find(params[:id])
    Book.increment_counter(:rank, @book)
    redirect_to root_path

  end



end
