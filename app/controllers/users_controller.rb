class UsersController < ApplicationController
before_action :authenticate_user!, except: [:new]
before_action :correct_user,   only: [:edit, :update]
	
	def show
		@user = User.find(params[:id])
		# @user = current_user
		@book = Book.new
		@books = @user.books.all

	end
	def new
		
	end
	# def create
	# 	@book = Book.new
	#     @book.user_id = current_user.id
	#  if @book.save
	#     redirect_to books_path
	#  else
 #     	@books = Book.all
	#  	render :show
	# 	end
	# end
	def index
		@book = Book.new
		# @user = User.find(params[:id]
		@user = current_user
		@users = User.all
	end
	def edit
        @user = User.find(params[:id])
    end
    def update
    	@book = Book.new
    	@users = User.all
    	@user = User.find(params[:id])
     if @user.update(user_params)
     	flash[:notice] = "successfully"
    	redirect_to user_path(@user.id)
    else
    	@books = Book.all
    	render :edit
    end
    end

    private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
	end

	def correct_user
	@user = User.find(params[:id])
	unless @user == current_user
		redirect_to user_path(current_user)
	end
	end
end
