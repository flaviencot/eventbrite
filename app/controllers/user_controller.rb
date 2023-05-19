class UserController < ApplicationController

  before_action :authenticate_user!

  def index
  end
  

  def show
    @user = User.find(params[:id].to_i)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
                   'first_name' => params[:first_name],
                   'last_name' => params[:last_name],
                   'email' => params[:email]#,
                  # 'password' => params[:password]
                   )
     if @user.save
      @user.authenticate(params[:password])
     # session[:user_id] = @user.id
      redirect_to root_path(success: true)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
