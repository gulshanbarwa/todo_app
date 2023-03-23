class DeltaController < ApplicationController
  def index
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :signup
    end
  end

  def login
    if session[:user_id]
      @user = User.find(session[:user_id])
      @mail = @user.email
      redirect_to new_data_path, notice: 'User is already logged in.'
    else
      @user = User.new
    end
  end

  def attempt_login
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to new_data_path, notice: 'Login successful.'
   
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out.'
  end


  def create_todo
  end

  def show
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end