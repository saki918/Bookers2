class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:new]
    before_action :current_user,   only: [:edit, :update, :destroy, :create]
    def new
    # new.htmlが無いなら必要ない？
    
    end
    def create
      @user = current_user
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if  @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
   	else
   	    @books = Book.all
   	    render :index
 	  end
    end

    def index
      @user = current_user
      # @user = User.find(params[:id])
      @users = User.all
      @book = Book.new
      @books = Book.all
      # @book = user
    end

    def show
      # @user = current_user
      # @user = User.find(params[:id])
      @book_new = Book.new
      @book = Book.find(params[:id])

    end

    def destroy
  	  book = Book.find(params[:id])
  	  book.user_id = current_user.id
  	  book.destroy
  	  redirect_to books_path
    end
    def edit
  	  @book = Book.find(params[:id])
      @user = @book.user
      unless @user == current_user
      redirect_to(books_path)
    end
	end
	def update
      @user = current_user
  	  @book = Book.find(params[:id])
  	  @book.user_id = current_user.id
  	  if @book.update(book_params)
      flash[:notice] = "successfully"
  	  redirect_to book_path
      else
      @books = Book.all
      render :index
    end
  end

private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
