class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def children_index
    @children = Child.all.includes(:presents).includes(:judgments)
  end

  def elves_index
    @elves = Elf.all
  end

  def show
    @users = [User.find_by_id(session[:current_user_id])]
  end

  def create
    @user = User.new(user_params)

      if @user.save
        flash[:message] = "You are logged in!"
      else
        flash[:message] = @user.errors.full_messages.to_sentence
      end

        redirect_to root_path
      end

      private

      def user_params
        return params.require(:user).permit(:name, :address, :type, :age, :email, :password)
      end
  end
